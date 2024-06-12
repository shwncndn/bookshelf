defmodule BookshelfWeb.RecordLive.Index do
  use BookshelfWeb, :live_view

  alias Bookshelf.Formats
  alias Bookshelf.Formats.Record

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :records, Formats.list_records())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Record")
    |> assign(:record, Formats.get_record!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Record")
    |> assign(:record, %Record{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Records")
    |> assign(:record, nil)
  end

  @impl true
  def handle_info({BookshelfWeb.RecordLive.FormComponent, {:saved, record}}, socket) do
    {:noreply, stream_insert(socket, :records, record)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    record = Formats.get_record!(id)
    {:ok, _} = Formats.delete_record(record)

    {:noreply, stream_delete(socket, :records, record)}
  end
end
