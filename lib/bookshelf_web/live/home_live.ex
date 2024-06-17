defmodule BookshelfWeb.HomeLive do
  use BookshelfWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      live
    """
  end
end
