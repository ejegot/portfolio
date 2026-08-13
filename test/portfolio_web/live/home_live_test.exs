defmodule PortfolioWeb.HomeLiveTest do
  use PortfolioWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders the homepage", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/")

    assert html =~ "ELJHUN EGOT"
    assert html =~ "WEB DEVELOPER · LEARNER · BUILDER"
    assert html =~ "I build systems while learning how software actually works."

    assert html =~
             "Documenting my journey through Elixir, Phoenix, databases, and building real-world applications."

    assert html =~ "View my work"
    assert html =~ ~s(href="/projects")

    assert html =~ "SELECTED WORK"
    assert html =~ "Gym System"
    assert html =~ "Gym management system"
    assert html =~ ~s(href="/projects/gym-system")
    assert html =~ "Basketball System"
    assert html =~ "Basketball league system"
    assert html =~ ~s(href="/projects/basketball-system")
    assert html =~ "AISOF"
    assert html =~ "Government procurement system"
    assert html =~ ~s(href="/projects/aisof")

    assert html =~ "LEARNING JOURNEY"

    assert html =~
             "I started learning by building systems from scratch, figuring things out one problem at a time."

    assert html =~ "Read my learning journey"
    assert html =~ ~s(href="/learning")

    assert html =~ "ABOUT"
    assert html =~ "web developer"
    assert html =~ "Elixir"
    assert html =~ "Be patient"

    assert html =~ "CONTACT"
    assert html =~ "Want to see what I"
    assert html =~ "building?"
    assert html =~ "GitHub"
    assert html =~ ~s(href="https://github.com/ejegot")

    assert html =~ "Built while learning"
  end
end
