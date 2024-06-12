defmodule BookshelfWeb.CdLive.Index do
  use BookshelfWeb, :live_view

  alias Bookshelf.Formats
  alias Bookshelf.Formats.Cd

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :cds, Formats.list_cds())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Cd")
    |> assign(:cd, Formats.get_cd!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Cd")
    |> assign(:cd, %Cd{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Cds")
    |> assign(:cd, nil)
  end

  @impl true
  def handle_info({BookshelfWeb.CdLive.FormComponent, {:saved, cd}}, socket) do
    {:noreply, stream_insert(socket, :cds, cd)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    cd = Formats.get_cd!(id)
    {:ok, _} = Formats.delete_cd(cd)

    {:noreply, stream_delete(socket, :cds, cd)}
  end
end
