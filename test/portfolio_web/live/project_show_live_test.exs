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
      assert html =~ "Technologies"
      assert html =~ "What I built"
      assert html =~ "What I learned"
      assert html =~ "Challenges"
      assert html =~ "Current status"
      assert html =~ "Back to Projects"
      assert html =~ ~s(href="/projects")
    end
  end

  test "invalid slug returns 404", %{conn: conn} do
    assert_error_sent 404, fn ->
      get(conn, ~p"/projects/does-not-exist")
    end
  end
end
