defmodule BookshelfWeb.CdLiveTest do
  use BookshelfWeb.ConnCase

  import Phoenix.LiveViewTest
  import Bookshelf.FormatsFixtures

  @create_attrs %{title: "some title", artist: "some artist", published: 42}
  @update_attrs %{title: "some updated title", artist: "some updated artist", published: 43}
  @invalid_attrs %{title: nil, artist: nil, published: nil}

  defp create_cd(_) do
    cd = cd_fixture()
    %{cd: cd}
  end

  describe "Index" do
    setup [:create_cd]

    test "lists all cds", %{conn: conn, cd: cd} do
      {:ok, _index_live, html} = live(conn, ~p"/cds")

      assert html =~ "Listing Cds"
      assert html =~ cd.title
    end

    test "saves new cd", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/cds")

      assert index_live |> element("a", "New Cd") |> render_click() =~
               "New Cd"

      assert_patch(index_live, ~p"/cds/new")

      assert index_live
             |> form("#cd-form", cd: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#cd-form", cd: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/cds")

      html = render(index_live)
      assert html =~ "Cd created successfully"
      assert html =~ "some title"
    end

    test "updates cd in listing", %{conn: conn, cd: cd} do
      {:ok, index_live, _html} = live(conn, ~p"/cds")

      assert index_live |> element("#cds-#{cd.id} a", "Edit") |> render_click() =~
               "Edit Cd"

      assert_patch(index_live, ~p"/cds/#{cd}/edit")

      assert index_live
             |> form("#cd-form", cd: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#cd-form", cd: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/cds")

      html = render(index_live)
      assert html =~ "Cd updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes cd in listing", %{conn: conn, cd: cd} do
      {:ok, index_live, _html} = live(conn, ~p"/cds")

      assert index_live |> element("#cds-#{cd.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#cds-#{cd.id}")
    end
  end

  describe "Show" do
    setup [:create_cd]

    test "displays cd", %{conn: conn, cd: cd} do
      {:ok, _show_live, html} = live(conn, ~p"/cds/#{cd}")

      assert html =~ "Show Cd"
      assert html =~ cd.title
    end

    test "updates cd within modal", %{conn: conn, cd: cd} do
      {:ok, show_live, _html} = live(conn, ~p"/cds/#{cd}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Cd"

      assert_patch(show_live, ~p"/cds/#{cd}/show/edit")

      assert show_live
             |> form("#cd-form", cd: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#cd-form", cd: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/cds/#{cd}")

      html = render(show_live)
      assert html =~ "Cd updated successfully"
      assert html =~ "some updated title"
    end
  end
end
