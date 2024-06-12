defmodule BookshelfWeb.CdLive.FormComponent do
  use BookshelfWeb, :live_component

  alias Bookshelf.Formats

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage cd records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="cd-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:artist]} type="text" label="Artist" />
        <.input field={@form[:published]} type="number" label="Published" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Cd</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{cd: cd} = assigns, socket) do
    changeset = Formats.change_cd(cd)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"cd" => cd_params}, socket) do
    changeset =
      socket.assigns.cd
      |> Formats.change_cd(cd_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"cd" => cd_params}, socket) do
    save_cd(socket, socket.assigns.action, cd_params)
  end

  defp save_cd(socket, :edit, cd_params) do
    case Formats.update_cd(socket.assigns.cd, cd_params) do
      {:ok, cd} ->
        notify_parent({:saved, cd})

        {:noreply,
         socket
         |> put_flash(:info, "Cd updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_cd(socket, :new, cd_params) do
    case Formats.create_cd(cd_params) do
      {:ok, cd} ->
        notify_parent({:saved, cd})

        {:noreply,
         socket
         |> put_flash(:info, "Cd created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
