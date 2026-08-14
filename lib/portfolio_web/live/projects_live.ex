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
    <div class="min-w-0 space-y-12 sm:space-y-20">
      <section class="space-y-4 pt-1 sm:space-y-6 sm:pt-6">
        <h1 class="font-display text-3xl font-semibold leading-tight tracking-display text-zinc-950 sm:text-5xl sm:leading-[1.05] lg:text-6xl">
          SELECTED WORK
        </h1>
        <p class="max-w-md text-base leading-relaxed text-zinc-600 sm:text-lg">
          Projects I've built while learning software development.
        </p>
      </section>

      <section>
        <ul class="min-w-0 border-t border-zinc-200">
          <li :for={project <- @projects} class="min-w-0 border-b border-zinc-200">
            <.link
              navigate={~p"/projects/#{project.slug}"}
              class="project-list-item group grid min-h-[4.5rem] grid-cols-[minmax(0,1fr)_auto] items-end gap-4 py-7 sm:min-h-0 sm:gap-10 sm:py-10"
            >
              <div class="min-w-0 space-y-2 sm:space-y-3">
                <p class="text-xs tracking-[0.14em] text-zinc-400 sm:tracking-[0.16em]">
                  {project.number}
                </p>
                <h2 class="project-list-title break-words font-display text-2xl font-semibold tracking-display text-zinc-950 transition-transform duration-200 sm:text-3xl">
                  {project.title}
                </h2>
                <p class="text-sm leading-relaxed text-zinc-600 sm:text-base">
                  {project.summary}
                </p>
              </div>
              <span class="project-list-arrow shrink-0 pb-1 text-xl text-zinc-400 transition-all duration-200 group-hover:text-zinc-950">
                →
              </span>
            </.link>
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
        number: "01",
        title: "GYM SYSTEM",
        summary: "Gym management system"
      },
      %{
        slug: "basketball-system",
        number: "02",
        title: "BASKETBALL SYSTEM",
        summary: "Basketball league system"
      },
      %{
        slug: "aisof",
        number: "03",
        title: "AISOF",
        summary: "Government procurement system"
      },
      %{
        slug: "learning-portfolio",
        number: "04",
        title: "LEARNING PORTFOLIO",
        summary: "My personal learning portfolio"
      }
    ]
  end
end
