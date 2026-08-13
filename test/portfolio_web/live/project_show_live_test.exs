defmodule PortfolioWeb.ProjectShowLiveTest do
  use PortfolioWeb.ConnCase

  import Phoenix.LiveViewTest

  @slugs ~w(gym-system basketball-system aisof learning-portfolio)

  @expected_names %{
    "gym-system" => "Gym System",
    "basketball-system" => "Basketball System",
    "aisof" => "AISOF",
    "learning-portfolio" => "Learning Portfolio"
  }

  for slug <- @slugs do
    test "renders project detail for #{slug}", %{conn: conn} do
      slug = unquote(slug)
      name = @expected_names[slug]

      {:ok, _view, html} = live(conn, ~p"/projects/#{slug}")

      assert html =~ name
      assert html =~ "Overview"
      assert html =~ "What I built"
      assert html =~ "What I learned"
      assert html =~ "Challenges"
      assert html =~ "Back to projects"
      assert html =~ ~s(href="/projects")
    end
  end

  test "shows technologies when present and hides when empty", %{conn: conn} do
    {:ok, _view, gym_html} = live(conn, ~p"/projects/gym-system")
    assert gym_html =~ "Elixir · Phoenix LiveView · PostgreSQL · Tailwind CSS"

    {:ok, _view, aisof_html} = live(conn, ~p"/projects/aisof")
    refute aisof_html =~ "Elixir · Phoenix LiveView · PostgreSQL · Tailwind CSS"
    refute aisof_html =~ "Elixir · Phoenix LiveView</p>"
  end

  test "shows current status only when present", %{conn: conn} do
    {:ok, _view, portfolio_html} = live(conn, ~p"/projects/learning-portfolio")
    assert portfolio_html =~ "Current status"
    assert portfolio_html =~ "In progress"

    {:ok, _view, gym_html} = live(conn, ~p"/projects/gym-system")
    refute gym_html =~ "Current status"
  end

  test "invalid slug returns 404", %{conn: conn} do
    assert_error_sent 404, fn ->
      get(conn, ~p"/projects/does-not-exist")
    end
  end
end
