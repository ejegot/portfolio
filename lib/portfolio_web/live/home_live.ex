defmodule PortfolioWeb.HomeLive do
  use PortfolioWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Home")
      |> assign(:projects, selected_work())

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-w-0 space-y-16 sm:space-y-36 lg:space-y-44">
      <section class="space-y-6 pt-1 sm:space-y-10 sm:pt-6">
        <p class="text-[0.7rem] font-medium leading-relaxed tracking-[0.12em] text-zinc-400 uppercase sm:text-xs sm:tracking-[0.18em]">
          WEB DEVELOPER · LEARNER · BUILDER
        </p>
        <h1 class="max-w-2xl font-display text-3xl font-semibold leading-tight tracking-display text-zinc-950 sm:text-5xl sm:leading-[1.08] lg:text-6xl lg:leading-[1.05]">
          I build systems while learning how software actually works.
        </h1>
        <p class="max-w-md text-base leading-relaxed text-zinc-600 sm:text-lg">
          Documenting my journey through Elixir, Phoenix, databases, and building real-world applications.
        </p>
        <.link
          navigate={~p"/projects"}
          class="group inline-flex items-center gap-2 pt-2 text-sm font-medium tracking-wide text-zinc-950 transition-opacity duration-200 hover:opacity-60"
        >
          <span class="underline decoration-zinc-300 underline-offset-4 transition-colors duration-200 group-hover:decoration-zinc-950">
            View my work
          </span>
          <span class="transition-transform duration-200 group-hover:translate-x-0.5">→</span>
        </.link>
      </section>

      <section class="space-y-10 sm:space-y-12">
        <h2 class="font-display text-xs font-semibold tracking-[0.18em] text-zinc-400">
          SELECTED WORK
        </h2>
        <ul class="border-t border-zinc-200">
          <li :for={project <- @projects} class="border-b border-zinc-200">
            <.link
              navigate={~p"/projects/#{project.slug}"}
              class="group grid min-h-[4.5rem] grid-cols-[minmax(0,1fr)_auto] items-end gap-4 py-7 transition-colors duration-200 hover:bg-zinc-100/70 sm:min-h-0 sm:gap-10 sm:py-10 -mx-2 px-2 sm:-mx-3 sm:px-3"
            >
              <div class="min-w-0 space-y-2 sm:space-y-3">
                <p class="text-xs tracking-[0.16em] text-zinc-400">
                  {project.number}
                </p>
                <h3 class="break-words font-display text-xl font-semibold tracking-display text-zinc-950 transition-transform duration-200 group-hover:translate-x-1 sm:text-3xl uppercase">
                  {project.title}
                </h3>
                <p class="text-sm leading-relaxed text-zinc-600 sm:text-base">
                  {project.summary}
                </p>
              </div>
              <span class="shrink-0 pb-1 text-xl text-zinc-400 transition-all duration-200 group-hover:translate-x-1 group-hover:text-zinc-950">
                →
              </span>
            </.link>
          </li>
        </ul>
      </section>

      <section class="space-y-6 border-t border-zinc-200 pt-10 sm:space-y-10 sm:pt-24">
        <h2 class="font-display text-xs font-semibold tracking-[0.14em] text-zinc-400 sm:tracking-[0.18em]">
          LEARNING JOURNEY
        </h2>
        <p class="max-w-lg font-display text-xl font-medium leading-snug tracking-display text-zinc-950 sm:text-3xl sm:leading-snug">
          I started learning by building systems from scratch, figuring things out one problem at a time.
        </p>
        <.link
          navigate={~p"/learning"}
          class="group inline-flex items-center gap-2 text-sm font-medium tracking-wide text-zinc-950 transition-opacity duration-200 hover:opacity-60"
        >
          <span class="underline decoration-zinc-300 underline-offset-4 transition-colors duration-200 group-hover:decoration-zinc-950">
            Read my learning journey
          </span>
          <span class="transition-transform duration-200 group-hover:translate-x-0.5">→</span>
        </.link>
      </section>

      <section class="space-y-6 border-t border-zinc-200 pt-10 sm:space-y-10 sm:pt-24">
        <h2 class="font-display text-3xl font-semibold tracking-display text-zinc-950 sm:text-5xl">
          ABOUT
        </h2>
        <div class="max-w-xl space-y-5 sm:space-y-6">
          <p class="font-display text-xl font-medium leading-snug tracking-display text-zinc-950 sm:text-2xl sm:leading-snug">
            I didn't plan for programming to become part of my journey.
          </p>
          <div class="space-y-4 text-base leading-relaxed text-zinc-600 sm:space-y-5 sm:text-lg sm:leading-relaxed">
            <p>
              I started learning because God led me to meet a friend who introduced me to programming. That became the beginning of my journey into software development.
            </p>
            <p>
              Today, I'm working toward becoming a web developer, while continuing to learn and build with Elixir.
            </p>
            <p>
              Through building different systems, I've learned that progress doesn't happen all at once. Be patient, take things step by step, and stay consistent.
            </p>
          </div>
        </div>
      </section>

      <section class="space-y-6 border-t border-zinc-200 pt-10 sm:space-y-10 sm:pt-24">
        <h2 class="font-display text-3xl font-semibold tracking-display text-zinc-950 sm:text-5xl">
          CONTACT
        </h2>
        <p class="max-w-md font-display text-xl font-medium leading-snug tracking-display text-zinc-950 sm:text-3xl sm:leading-snug">
          Want to see what I'm building?
        </p>
        <a
          href="https://github.com/ejegot"
          target="_blank"
          rel="noopener noreferrer"
          class="group inline-flex items-center gap-2 text-sm font-medium tracking-wide text-zinc-950 transition-opacity duration-200 hover:opacity-60"
        >
          <span class="underline decoration-zinc-300 underline-offset-4 transition-colors duration-200 group-hover:decoration-zinc-950">
            GitHub
          </span>
          <span class="transition-transform duration-200 group-hover:translate-x-0.5">→</span>
        </a>
      </section>
    </div>
    """
  end

  defp selected_work do
    [
      %{
        number: "01",
        slug: "gym-system",
        title: "Gym System",
        summary: "Gym management system"
      },
      %{
        number: "02",
        slug: "basketball-system",
        title: "Basketball System",
        summary: "Basketball league system"
      },
      %{
        number: "03",
        slug: "aisof",
        title: "AISOF",
        summary: "Government procurement system"
      }
    ]
  end
end
