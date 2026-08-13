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
    <div class="space-y-16 sm:space-y-20">
      <section class="space-y-6 pt-2 sm:pt-6">
        <h1 class="font-display text-4xl font-semibold tracking-display text-zinc-950 sm:text-5xl sm:leading-[1.05] lg:text-6xl">
          SELECTED WORK
        </h1>
        <p class="max-w-md text-base leading-relaxed text-zinc-600 sm:text-lg">
          Projects I've built while learning software development.
        </p>
      </section>

      <section>
        <ul class="border-t border-zinc-200">
          <li :for={project <- @projects} class="border-b border-zinc-200">
            <.link
              navigate={~p"/projects/#{project.slug}"}
              class="group grid grid-cols-[1fr_auto] items-end gap-6 py-8 transition-colors duration-200 hover:bg-zinc-100/70 sm:gap-10 sm:py-10 -mx-2 px-2 sm:-mx-3 sm:px-3"
            >
              <div class="space-y-3">
                <p class="text-xs tracking-[0.16em] text-zinc-400">
                  {project.number}
                </p>
                <h2 class="font-display text-2xl font-semibold tracking-display text-zinc-950 transition-transform duration-200 group-hover:translate-x-1 sm:text-3xl">
                  {project.title}
                </h2>
                <p class="text-base text-zinc-600">
                  {project.summary}
                </p>
              </div>
              <span class="pb-1 text-xl text-zinc-400 transition-all duration-200 group-hover:translate-x-1 group-hover:text-zinc-950">
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
