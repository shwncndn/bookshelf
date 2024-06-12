defmodule BookshelfWeb.CassetteLive.FormComponent do
  use BookshelfWeb, :live_component

  alias Bookshelf.Formats

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage cassette records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="cassette-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:artist]} type="text" label="Artist" />
        <.input field={@form[:released]} type="number" label="Released" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Cassette</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{cassette: cassette} = assigns, socket) do
    changeset = Formats.change_cassette(cassette)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"cassette" => cassette_params}, socket) do
    changeset =
      socket.assigns.cassette
      |> Formats.change_cassette(cassette_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"cassette" => cassette_params}, socket) do
    save_cassette(socket, socket.assigns.action, cassette_params)
  end

  defp save_cassette(socket, :edit, cassette_params) do
    case Formats.update_cassette(socket.assigns.cassette, cassette_params) do
      {:ok, cassette} ->
        notify_parent({:saved, cassette})

        {:noreply,
         socket
         |> put_flash(:info, "Cassette updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_cassette(socket, :new, cassette_params) do
    case Formats.create_cassette(cassette_params) do
      {:ok, cassette} ->
        notify_parent({:saved, cassette})

        {:noreply,
         socket
         |> put_flash(:info, "Cassette created successfully")
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
