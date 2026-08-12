defmodule PortfolioWeb.ProjectsLive do
  use PortfolioWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Projects")
      |> assign(:projects, projects())

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
          Projects
        </h1>
        <p class="max-w-2xl text-base leading-relaxed text-zinc-600 sm:text-lg">
          Work from my coding journey — practice projects and this portfolio.
        </p>
      </section>

      <section>
        <ul class="space-y-8">
          <li
            :for={project <- @projects}
            class="space-y-2 border-t border-zinc-100 pt-8 first:border-t-0 first:pt-0"
          >
            <div class="flex flex-wrap items-baseline gap-x-3 gap-y-1">
              <.link
                navigate={~p"/projects/#{project.slug}"}
                class="text-lg font-medium text-zinc-900 hover:text-zinc-600"
              >
                {project.title}
              </.link>
              <span :if={project.technology != ""} class="text-sm text-zinc-400">
                {project.technology}
              </span>
            </div>
            <p :if={project.description != ""} class="max-w-2xl text-sm leading-relaxed text-zinc-600">
              {project.description}
            </p>
          </li>
        </ul>
      </section>
    </div>
    """
  end

  defp projects do
    [
      %{
        slug: "gym-system",
        title: "Gym System",
        technology: "Elixir · Phoenix LiveView",
        description: "A gym management system built while learning Phoenix LiveView."
      },
      %{
        slug: "basketball-system",
        title: "Basketball System",
        technology: "Elixir · Phoenix LiveView",
        description: "A basketball system project built as part of my coding practice."
      },
      %{
        slug: "aisof",
        title: "AISOF",
        technology: "",
        description: ""
      },
      %{
        slug: "learning-portfolio",
        title: "Learning Portfolio",
        technology: "Elixir · Phoenix LiveView",
        description: "This portfolio documents my coding journey and learning process."
      }
    ]
  end
end
