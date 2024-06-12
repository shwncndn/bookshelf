defmodule BookshelfWeb.SongbookLiveTest do
  use BookshelfWeb.ConnCase

  import Phoenix.LiveViewTest
  import Bookshelf.FormatsFixtures

  @create_attrs %{title: "some title", artist: "some artist", published: 42}
  @update_attrs %{title: "some updated title", artist: "some updated artist", published: 43}
  @invalid_attrs %{title: nil, artist: nil, published: nil}

  defp create_songbook(_) do
    songbook = songbook_fixture()
    %{songbook: songbook}
  end

  describe "Index" do
    setup [:create_songbook]

    test "lists all songbooks", %{conn: conn, songbook: songbook} do
      {:ok, _index_live, html} = live(conn, ~p"/songbooks")

      assert html =~ "Listing Songbooks"
      assert html =~ songbook.title
    end

    test "saves new songbook", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/songbooks")

      assert index_live |> element("a", "New Songbook") |> render_click() =~
               "New Songbook"

      assert_patch(index_live, ~p"/songbooks/new")

      assert index_live
             |> form("#songbook-form", songbook: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#songbook-form", songbook: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/songbooks")

      html = render(index_live)
      assert html =~ "Songbook created successfully"
      assert html =~ "some title"
    end

    test "updates songbook in listing", %{conn: conn, songbook: songbook} do
      {:ok, index_live, _html} = live(conn, ~p"/songbooks")

      assert index_live |> element("#songbooks-#{songbook.id} a", "Edit") |> render_click() =~
               "Edit Songbook"

      assert_patch(index_live, ~p"/songbooks/#{songbook}/edit")

      assert index_live
             |> form("#songbook-form", songbook: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#songbook-form", songbook: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/songbooks")

      html = render(index_live)
      assert html =~ "Songbook updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes songbook in listing", %{conn: conn, songbook: songbook} do
      {:ok, index_live, _html} = live(conn, ~p"/songbooks")

      assert index_live |> element("#songbooks-#{songbook.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#songbooks-#{songbook.id}")
    end
  end

  describe "Show" do
    setup [:create_songbook]

    test "displays songbook", %{conn: conn, songbook: songbook} do
      {:ok, _show_live, html} = live(conn, ~p"/songbooks/#{songbook}")

      assert html =~ "Show Songbook"
      assert html =~ songbook.title
    end

    test "updates songbook within modal", %{conn: conn, songbook: songbook} do
      {:ok, show_live, _html} = live(conn, ~p"/songbooks/#{songbook}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Songbook"

      assert_patch(show_live, ~p"/songbooks/#{songbook}/show/edit")

      assert show_live
             |> form("#songbook-form", songbook: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#songbook-form", songbook: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/songbooks/#{songbook}")

      html = render(show_live)
      assert html =~ "Songbook updated successfully"
      assert html =~ "some updated title"
    end
  end
end
