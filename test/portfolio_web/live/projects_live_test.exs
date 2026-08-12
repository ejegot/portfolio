defmodule PortfolioWeb.ProjectsLiveTest do
  use PortfolioWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders the projects page", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/projects")

    assert html =~ "Projects"
    assert html =~ "Gym System"
    assert html =~ "Basketball System"
    assert html =~ "AISOF"
    assert html =~ "Learning Portfolio"
    assert html =~ "Elixir · Phoenix LiveView"
    assert html =~ ~s(href="/projects/gym-system")
    assert html =~ ~s(href="/projects/basketball-system")
    assert html =~ ~s(href="/projects/aisof")
    assert html =~ ~s(href="/projects/learning-portfolio")
  end
end
