defmodule BookshelfWeb.RecordLiveTest do
  use BookshelfWeb.ConnCase

  import Phoenix.LiveViewTest
  import Bookshelf.FormatsFixtures

  @create_attrs %{title: "some title", artist: "some artist", released: 42}
  @update_attrs %{title: "some updated title", artist: "some updated artist", released: 43}
  @invalid_attrs %{title: nil, artist: nil, released: nil}

  defp create_record(_) do
    record = record_fixture()
    %{record: record}
  end

  describe "Index" do
    setup [:create_record]

    test "lists all records", %{conn: conn, record: record} do
      {:ok, _index_live, html} = live(conn, ~p"/bookshelf/records")

      assert html =~ "Listing Records"
      assert html =~ record.title
    end

    test "saves new record", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/bookshelf/records")

      assert index_live |> element("a", "New Record") |> render_click() =~
               "New Record"

      assert_patch(index_live, ~p"/bookshelf/records/new")

      assert index_live
             |> form("#record-form", record: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#record-form", record: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/bookshelf/records")

      html = render(index_live)
      assert html =~ "Record created successfully"
      assert html =~ "some title"
    end

    test "updates record in listing", %{conn: conn, record: record} do
      {:ok, index_live, _html} = live(conn, ~p"/bookshelf/records")

      assert index_live |> element("#records-#{record.id} a", "Edit") |> render_click() =~
               "Edit Record"

      assert_patch(index_live, ~p"/bookshelf/records/#{record}/edit")

      assert index_live
             |> form("#record-form", record: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#record-form", record: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/bookshelf/records")

      html = render(index_live)
      assert html =~ "Record updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes record in listing", %{conn: conn, record: record} do
      {:ok, index_live, _html} = live(conn, ~p"/bookshelf/records")

      assert index_live |> element("#records-#{record.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#records-#{record.id}")
    end
  end

  describe "Show" do
    setup [:create_record]

    test "displays record", %{conn: conn, record: record} do
      {:ok, _show_live, html} = live(conn, ~p"/bookshelf/records/#{record}")

      assert html =~ "Show Record"
      assert html =~ record.title
    end

    test "updates record within modal", %{conn: conn, record: record} do
      {:ok, show_live, _html} = live(conn, ~p"/bookshelf/records/#{record}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Record"

      assert_patch(show_live, ~p"/bookshelf/records/#{record}/show/edit")

      assert show_live
             |> form("#record-form", record: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#record-form", record: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/bookshelf/records/#{record}")

      html = render(show_live)
      assert html =~ "Record updated successfully"
      assert html =~ "some updated title"
    end
  end
end
