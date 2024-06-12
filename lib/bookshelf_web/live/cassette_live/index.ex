defmodule BookshelfWeb.CassetteLive.Index do
  use BookshelfWeb, :live_view

  alias Bookshelf.Formats
  alias Bookshelf.Formats.Cassette

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :cassettes, Formats.list_cassettes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Cassette")
    |> assign(:cassette, Formats.get_cassette!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Cassette")
    |> assign(:cassette, %Cassette{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Cassettes")
    |> assign(:cassette, nil)
  end

  @impl true
  def handle_info({BookshelfWeb.CassetteLive.FormComponent, {:saved, cassette}}, socket) do
    {:noreply, stream_insert(socket, :cassettes, cassette)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    cassette = Formats.get_cassette!(id)
    {:ok, _} = Formats.delete_cassette(cassette)

    {:noreply, stream_delete(socket, :cassettes, cassette)}
  end
end
