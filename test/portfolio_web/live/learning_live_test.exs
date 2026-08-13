defmodule PortfolioWeb.LearningLiveTest do
  use PortfolioWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders the learning journey page", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/learning")

    assert html =~ "LEARNING JOURNEY"
    assert html =~ "Documenting what I learn while building real systems."

    assert html =~ "What I learned"
    assert html =~ "What I built"
    assert html =~ "What I struggled with"
    assert html =~ "Next step"

    assert html =~ "Learning Journey page"
    assert html =~ "Portfolio homepage with LiveView"
    assert html =~ "Started the Phoenix portfolio project"

    assert html =~ "hardcoded entry data"
    assert html =~ "mount/3 assigns data to the socket"
    assert html =~ "Elixir 1.17.3"
    assert html =~ "Erlang to 27.3"
  end
end
