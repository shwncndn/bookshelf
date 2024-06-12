defmodule BookshelfWeb.SongbookLive.FormComponent do
  use BookshelfWeb, :live_component

  alias Bookshelf.Formats

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage songbook records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="songbook-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:artist]} type="text" label="Artist" />
        <.input field={@form[:published]} type="number" label="Published" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Songbook</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{songbook: songbook} = assigns, socket) do
    changeset = Formats.change_songbook(songbook)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"songbook" => songbook_params}, socket) do
    changeset =
      socket.assigns.songbook
      |> Formats.change_songbook(songbook_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"songbook" => songbook_params}, socket) do
    save_songbook(socket, socket.assigns.action, songbook_params)
  end

  defp save_songbook(socket, :edit, songbook_params) do
    case Formats.update_songbook(socket.assigns.songbook, songbook_params) do
      {:ok, songbook} ->
        notify_parent({:saved, songbook})

        {:noreply,
         socket
         |> put_flash(:info, "Songbook updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_songbook(socket, :new, songbook_params) do
    case Formats.create_songbook(songbook_params) do
      {:ok, songbook} ->
        notify_parent({:saved, songbook})

        {:noreply,
         socket
         |> put_flash(:info, "Songbook created successfully")
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
