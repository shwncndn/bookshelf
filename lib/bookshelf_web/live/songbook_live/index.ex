defmodule BookshelfWeb.SongbookLive.Index do
  use BookshelfWeb, :live_view

  alias Bookshelf.Formats
  alias Bookshelf.Formats.Songbook

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :songbooks, Formats.list_songbooks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Songbook")
    |> assign(:songbook, Formats.get_songbook!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Songbook")
    |> assign(:songbook, %Songbook{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Songbooks")
    |> assign(:songbook, nil)
  end

  @impl true
  def handle_info({BookshelfWeb.SongbookLive.FormComponent, {:saved, songbook}}, socket) do
    {:noreply, stream_insert(socket, :songbooks, songbook)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    songbook = Formats.get_songbook!(id)
    {:ok, _} = Formats.delete_songbook(songbook)

    {:noreply, stream_delete(socket, :songbooks, songbook)}
  end
end
