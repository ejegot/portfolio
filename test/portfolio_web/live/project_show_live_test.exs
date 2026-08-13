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

  test "renders Gym System content and key features", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/projects/gym-system")

    assert html =~ "Gym System"

    assert html =~
             "A gym management system to track gym records and help gym businesses manage their operations."

    assert html =~
             "I built a gym management system to track gym records and help gym businesses manage their operations."

    assert html =~ "Key Features"
    assert html =~ "Member Management"
    assert html =~ "QR Check-in"
    assert html =~ "Digital Member ID"
    assert html =~ "Project Visual"
    assert html =~ ~s(src="/images/gym-system-showcase.png")
    assert html =~ ~s(alt="Gym System dashboard")
    assert html =~ "I learned how to build a system from scratch"
    assert html =~ "My biggest challenge was not knowing where to start."
  end

  test "renders Basketball System content and key features", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/projects/basketball-system")

    assert html =~ "Basketball System"

    assert html =~
             "A basketball system that can track player and game statistics and provide online registration for running a basketball league."

    assert html =~
             "A basketball system that can track stats and support online registration for running a basketball league."

    assert html =~
             "I built a basketball system that can track statistics and handle online registration to help run a basketball league."

    assert html =~ "Key Features"
    assert html =~ "Player Statistics"
    assert html =~ "Online Registration"
    assert html =~ "League Management"
    assert html =~ "Project Visual"
    assert html =~ ~s(src="/images/basketball-system-showcase.png")
    assert html =~ ~s(alt="Basketball System dashboard")
    assert html =~ "I learned how to build a system from scratch"
    assert html =~ "My biggest challenge was not knowing where to start."
  end

  test "renders AISOF content and key features without technologies or status", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/projects/aisof")

    assert html =~ "AISOF"

    assert html =~
             "An end-to-end procurement system designed to support government organizations in managing their procurement processes."

    assert html =~ "I worked on a procurement system covering Purchase Requests"
    assert html =~ "Key Features"
    assert html =~ "Purchase Requests"
    assert html =~ "Canvassing and Quotations"
    assert html =~ "Procurement Tracking"
    assert html =~ "Project Visual"
    assert html =~ ~s(src="/images/aisof-showcase.png")
    assert html =~ ~s(alt="AISOF procurement system dashboard")
    assert html =~ "I learned how to build a procurement system"
    assert html =~ "My biggest challenge was that procurement was new to me."
    refute html =~ "Current status"
  end

  test "shows current status only when present", %{conn: conn} do
    {:ok, _view, portfolio_html} = live(conn, ~p"/projects/learning-portfolio")
    assert portfolio_html =~ "Current status"
    assert portfolio_html =~ "In progress"
    refute portfolio_html =~ "Key Features"
    refute portfolio_html =~ "Project Visual"

    {:ok, _view, gym_html} = live(conn, ~p"/projects/gym-system")
    refute gym_html =~ "Current status"
  end

  test "invalid slug returns 404", %{conn: conn} do
    assert_error_sent 404, fn ->
      get(conn, ~p"/projects/does-not-exist")
    end
  end
end
