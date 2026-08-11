defmodule PortfolioWeb.HomeLive do
  use PortfolioWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Home")
      |> assign(:learning, learning())
      |> assign(:projects, featured_projects())

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="space-y-16">
      <section class="space-y-5">
        <p class="text-sm font-medium tracking-wide text-zinc-500 uppercase">
          Learning Portfolio
        </p>
        <h1 class="text-3xl font-semibold tracking-tight text-zinc-900 sm:text-4xl">
          Documenting my coding journey
        </h1>
        <p class="max-w-2xl text-base leading-relaxed text-zinc-600 sm:text-lg">
          This site is a simple record of what I build while learning to code.
          I share short notes on what I am studying and the projects I ship along the way —
          progress over polish, one step at a time.
        </p>
      </section>

      <section class="space-y-6">
        <div class="space-y-2">
          <h2 class="text-xl font-semibold tracking-tight text-zinc-900">
            Currently learning
          </h2>
          <p class="text-sm text-zinc-500">
            Focus areas I am working through right now.
          </p>
        </div>
        <ul class="divide-y divide-zinc-100 border-y border-zinc-100">
          <li
            :for={item <- @learning}
            class="flex flex-col gap-1 py-4 sm:flex-row sm:items-baseline sm:justify-between sm:gap-8"
          >
            <span class="font-medium text-zinc-900">{item.title}</span>
            <span class="text-sm text-zinc-500 sm:text-right">{item.note}</span>
          </li>
        </ul>
      </section>

      <section class="space-y-6">
        <div class="space-y-2">
          <h2 class="text-xl font-semibold tracking-tight text-zinc-900">
            Featured projects
          </h2>
          <p class="text-sm text-zinc-500">
            Selected work from this learning path.
          </p>
        </div>
        <ul class="space-y-8">
          <li :for={project <- @projects} class="space-y-2 border-t border-zinc-100 pt-8 first:border-t-0 first:pt-0">
            <div class="flex flex-wrap items-baseline gap-x-3 gap-y-1">
              <h3 class="text-lg font-medium text-zinc-900">{project.title}</h3>
              <span class="text-sm text-zinc-400">{project.stack}</span>
            </div>
            <p class="max-w-2xl text-sm leading-relaxed text-zinc-600">
              {project.description}
            </p>
          </li>
        </ul>
      </section>
    </div>
    """
  end

  defp learning do
    [
      %{
        title: "Elixir",
        note: "Language fundamentals and functional patterns"
      },
      %{
        title: "Phoenix & LiveView",
        note: "Server-rendered interactive web apps"
      },
      %{
        title: "Tailwind CSS",
        note: "Utility-first styling for clean, minimal UI"
      }
    ]
  end

  defp featured_projects do
    [
      %{
        title: "Learning Portfolio",
        stack: "Elixir · Phoenix · LiveView · Tailwind",
        description:
          "This site — a minimal place to introduce myself, track what I am learning, and showcase projects as I build them."
      },
      %{
        title: "Coming soon",
        stack: "In progress",
        description:
          "More projects will appear here as I finish them. Each one will document a concrete step in the journey."
      }
    ]
  end
end
