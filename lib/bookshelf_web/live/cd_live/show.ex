defmodule BookshelfWeb.CdLive.Show do
  use BookshelfWeb, :live_view

  alias Bookshelf.Formats

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:cd, Formats.get_cd!(id))}
  end

  defp page_title(:show), do: "Show Cd"
  defp page_title(:edit), do: "Edit Cd"
end
