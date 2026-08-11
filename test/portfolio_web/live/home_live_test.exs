defmodule PortfolioWeb.HomeLiveTest do
  use PortfolioWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders the homepage", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/")

    assert html =~ "Documenting my coding journey"
    assert html =~ "Currently learning"
    assert html =~ "Featured projects"
    assert html =~ "Elixir"
    assert html =~ "Learning Portfolio"
  end
end
