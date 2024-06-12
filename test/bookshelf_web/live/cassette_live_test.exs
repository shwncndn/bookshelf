defmodule BookshelfWeb.CassetteLiveTest do
  use BookshelfWeb.ConnCase

  import Phoenix.LiveViewTest
  import Bookshelf.FormatsFixtures

  @create_attrs %{title: "some title", artist: "some artist", released: 42}
  @update_attrs %{title: "some updated title", artist: "some updated artist", released: 43}
  @invalid_attrs %{title: nil, artist: nil, released: nil}

  defp create_cassette(_) do
    cassette = cassette_fixture()
    %{cassette: cassette}
  end

  describe "Index" do
    setup [:create_cassette]

    test "lists all cassettes", %{conn: conn, cassette: cassette} do
      {:ok, _index_live, html} = live(conn, ~p"/cassettes")

      assert html =~ "Listing Cassettes"
      assert html =~ cassette.title
    end

    test "saves new cassette", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/cassettes")

      assert index_live |> element("a", "New Cassette") |> render_click() =~
               "New Cassette"

      assert_patch(index_live, ~p"/cassettes/new")

      assert index_live
             |> form("#cassette-form", cassette: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#cassette-form", cassette: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/cassettes")

      html = render(index_live)
      assert html =~ "Cassette created successfully"
      assert html =~ "some title"
    end

    test "updates cassette in listing", %{conn: conn, cassette: cassette} do
      {:ok, index_live, _html} = live(conn, ~p"/cassettes")

      assert index_live |> element("#cassettes-#{cassette.id} a", "Edit") |> render_click() =~
               "Edit Cassette"

      assert_patch(index_live, ~p"/cassettes/#{cassette}/edit")

      assert index_live
             |> form("#cassette-form", cassette: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#cassette-form", cassette: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/cassettes")

      html = render(index_live)
      assert html =~ "Cassette updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes cassette in listing", %{conn: conn, cassette: cassette} do
      {:ok, index_live, _html} = live(conn, ~p"/cassettes")

      assert index_live |> element("#cassettes-#{cassette.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#cassettes-#{cassette.id}")
    end
  end

  describe "Show" do
    setup [:create_cassette]

    test "displays cassette", %{conn: conn, cassette: cassette} do
      {:ok, _show_live, html} = live(conn, ~p"/cassettes/#{cassette}")

      assert html =~ "Show Cassette"
      assert html =~ cassette.title
    end

    test "updates cassette within modal", %{conn: conn, cassette: cassette} do
      {:ok, show_live, _html} = live(conn, ~p"/cassettes/#{cassette}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Cassette"

      assert_patch(show_live, ~p"/cassettes/#{cassette}/show/edit")

      assert show_live
             |> form("#cassette-form", cassette: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#cassette-form", cassette: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/cassettes/#{cassette}")

      html = render(show_live)
      assert html =~ "Cassette updated successfully"
      assert html =~ "some updated title"
    end
  end
end
