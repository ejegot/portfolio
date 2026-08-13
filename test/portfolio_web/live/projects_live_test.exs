defmodule PortfolioWeb.ProjectsLiveTest do
  use PortfolioWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders the projects page", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/projects")

    assert html =~ "SELECTED WORK"
    assert html =~ "Projects I"
    assert html =~ "built while learning software development."

    assert html =~ "01"
    assert html =~ "GYM SYSTEM"
    assert html =~ "Gym management system"
    assert html =~ ~s(href="/projects/gym-system")

    assert html =~ "02"
    assert html =~ "BASKETBALL SYSTEM"
    assert html =~ "Basketball league system"
    assert html =~ ~s(href="/projects/basketball-system")

    assert html =~ "03"
    assert html =~ "AISOF"
    assert html =~ "Government procurement system"
    assert html =~ ~s(href="/projects/aisof")

    assert html =~ "04"
    assert html =~ "LEARNING PORTFOLIO"
    assert html =~ "My personal learning portfolio"
    assert html =~ ~s(href="/projects/learning-portfolio")
  end
end
