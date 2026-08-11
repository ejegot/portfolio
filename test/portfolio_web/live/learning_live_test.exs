defmodule PortfolioWeb.LearningLiveTest do
  use PortfolioWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders the learning journey page", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/learning")

    assert html =~ "Learning journey"
    assert html =~ "What I learned"
    assert html =~ "What I built"
    assert html =~ "What I struggled with"
    assert html =~ "Next step"
    assert html =~ "Learning Journey page"
    assert html =~ "Portfolio homepage with LiveView"
    assert html =~ "Started the Phoenix portfolio project"
    assert html =~ "href=\"/learning\""
  end
end
