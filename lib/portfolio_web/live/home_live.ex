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
      <section class="hero-stage relative pt-1 sm:pt-6">
        <div class="grid items-end gap-10 lg:grid-cols-[minmax(0,1fr)_14rem] lg:gap-12">
          <div class="min-w-0 space-y-6 sm:space-y-8">
            <p class="hero-identity text-[0.7rem] font-medium leading-relaxed tracking-[0.12em] text-zinc-400 uppercase sm:text-xs sm:tracking-[0.18em]">
              WEB DEVELOPER · LEARNER · BUILDER
            </p>
            <h1 class="hero-name font-display font-semibold tracking-display text-zinc-950">
              <span>ELJHUN</span>
              <span>EGOT</span>
            </h1>
            <p class="hero-statement max-w-xl font-display text-xl font-medium leading-snug tracking-display text-zinc-950 sm:text-3xl sm:leading-snug">
              I build systems while learning how software actually works.
            </p>
            <p class="max-w-md text-base leading-relaxed text-zinc-600 sm:text-lg">
              Documenting my journey through Elixir, Phoenix, databases, and building real-world applications.
            </p>
            <.link
              navigate={~p"/projects"}
              class="group inline-flex min-h-11 items-center gap-2 pt-1 text-sm font-medium tracking-wide text-zinc-950 transition-opacity duration-200 hover:opacity-60 sm:min-h-0 sm:pt-2"
            >
              <span class="underline decoration-zinc-300 underline-offset-4 transition-colors duration-200 group-hover:decoration-zinc-950">
                View my work
              </span>
              <span class="transition-transform duration-200 group-hover:translate-x-0.5">→</span>
            </.link>
          </div>

          <div class="hero-schematic hidden lg:block" aria-hidden="true">
            <svg viewBox="0 0 160 280" class="h-auto w-full max-w-[14rem]" fill="none">
              <line class="hero-schematic-line" x1="28" y1="12" x2="28" y2="268" />
              <g class="hero-node hero-node-1">
                <circle cx="28" cy="48" r="4.5" />
                <line x1="28" y1="48" x2="118" y2="48" />
                <rect x="118" y="34" width="28" height="28" rx="3" />
              </g>
              <g class="hero-node hero-node-2">
                <circle cx="28" cy="140" r="4.5" />
                <line x1="28" y1="140" x2="92" y2="140" />
                <rect x="92" y="126" width="28" height="28" rx="3" />
              </g>
              <g class="hero-node hero-node-3">
                <circle cx="28" cy="232" r="4.5" />
                <line x1="28" y1="232" x2="132" y2="232" />
                <rect x="132" y="218" width="28" height="28" rx="3" />
              </g>
            </svg>
          </div>
        </div>

        <div class="hero-schematic mt-8 lg:hidden" aria-hidden="true">
          <svg viewBox="0 0 320 28" class="h-7 w-full max-w-sm" fill="none">
            <line class="hero-schematic-line" x1="8" y1="14" x2="312" y2="14" />
            <g class="hero-node hero-node-1">
              <rect x="40" y="4" width="20" height="20" rx="2" />
            </g>
            <g class="hero-node hero-node-2">
              <rect x="150" y="4" width="20" height="20" rx="2" />
            </g>
            <g class="hero-node hero-node-3">
              <rect x="260" y="4" width="20" height="20" rx="2" />
            </g>
          </svg>
        </div>
      </section>

      <section class="work-stage space-y-12 sm:space-y-16">
        <h2 class="editorial-label">
          SELECTED WORK
        </h2>
        <ul class="space-y-16 sm:space-y-24 lg:space-y-28">
          <li :for={project <- @projects} class="work-item min-w-0">
            <.link
              navigate={~p"/projects/#{project.slug}"}
              class="group block min-w-0 space-y-5 sm:space-y-6"
            >
              <div class="min-w-0 space-y-2 sm:space-y-3">
                <p class="text-xs tracking-[0.14em] text-zinc-400 sm:tracking-[0.16em]">
                  {project.number}
                </p>
                <h3 class="work-title break-words font-display text-2xl font-semibold tracking-display text-zinc-950 sm:text-4xl uppercase">
                  {project.title}
                </h3>
                <p class="text-sm leading-relaxed text-zinc-600 sm:text-base">
                  {project.summary}
                </p>
              </div>
              <div class="work-visual">
                <img
                  src={project.image}
                  alt={project.alt}
                  width={project.image_width}
                  height={project.image_height}
                  class="work-visual-img"
                />
              </div>
              <span class="work-cta inline-flex min-h-11 items-center gap-2 text-sm font-medium tracking-wide text-zinc-950 sm:min-h-0">
                <span>View project</span>
                <span aria-hidden="true">→</span>
              </span>
            </.link>
          </li>
        </ul>
      </section>

      <section class="journey-stage border-t border-zinc-200 pt-12 sm:pt-24">
        <div class="space-y-10 sm:space-y-14">
          <h2 class="editorial-label">
            LEARNING JOURNEY
          </h2>

          <ol class="journey-timeline min-w-0">
            <li class="journey-step">
              <div class="journey-step-marker" aria-hidden="true">
                <span class="journey-step-number">01</span>
              </div>
              <div class="journey-step-body min-w-0 space-y-8 sm:space-y-10">
                <p class="max-w-lg font-display text-xl font-medium leading-snug tracking-display text-zinc-950 sm:text-3xl sm:leading-snug">
                  I started learning by building systems from scratch, figuring things out one problem at a time.
                </p>
                <div class="border-t border-zinc-200 pt-8 sm:pt-10">
                  <.link
                    navigate={~p"/learning"}
                    class="journey-cta group inline-flex min-h-11 items-center gap-2 text-sm font-medium tracking-wide text-zinc-950 transition-opacity duration-200 hover:opacity-60 sm:min-h-0"
                  >
                    <span class="underline decoration-zinc-300 underline-offset-4 transition-colors duration-200 group-hover:decoration-zinc-950">
                      Read my learning journey
                    </span>
                    <span
                      class="transition-transform duration-200 group-hover:translate-x-0.5"
                      aria-hidden="true"
                    >
                      →
                    </span>
                  </.link>
                </div>
              </div>
            </li>
          </ol>
        </div>
      </section>

      <section class="about-stage border-t border-zinc-200 pt-12 sm:pt-24">
        <div class="space-y-10 sm:space-y-14">
          <h2 class="font-display text-3xl font-semibold tracking-display text-zinc-950 sm:text-5xl">
            ABOUT
          </h2>
          <div class="about-content min-w-0 max-w-xl">
            <p class="about-lead max-w-lg font-display text-xl font-medium leading-snug tracking-display text-zinc-950 sm:text-2xl sm:leading-snug">
              I didn't plan for programming to become part of my journey.
            </p>
            <div class="about-body space-y-4 border-t border-zinc-200 pt-8 text-base leading-relaxed text-zinc-600 sm:space-y-5 sm:pt-10 sm:text-lg sm:leading-relaxed">
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
        </div>
      </section>

      <section class="contact-stage border-t border-zinc-200 pt-12 sm:pt-24">
        <div class="space-y-10 sm:space-y-14">
          <h2 class="font-display text-3xl font-semibold tracking-display text-zinc-950 sm:text-5xl">
            CONTACT
          </h2>
          <div class="contact-content min-w-0 max-w-xl">
            <p class="contact-closing max-w-md font-display text-xl font-medium leading-snug tracking-display text-zinc-950 sm:text-3xl sm:leading-snug">
              Want to see what I'm building?
            </p>
            <div class="border-t border-zinc-200 pt-8 sm:pt-10">
              <a
                href="https://github.com/ejegot"
                target="_blank"
                rel="noopener noreferrer"
                class="contact-link group inline-flex min-h-11 items-center gap-2 text-sm font-medium tracking-wide text-zinc-950 transition-opacity duration-200 hover:opacity-60 sm:min-h-0"
              >
                <span class="underline decoration-zinc-300 underline-offset-4 transition-colors duration-200 group-hover:decoration-zinc-950">
                  GitHub
                </span>
                <span class="transition-transform duration-200 group-hover:translate-x-0.5">→</span>
              </a>
            </div>
          </div>
        </div>
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
        summary: "Gym management system",
        image: ~p"/images/gym-system-showcase.png",
        alt: "Gym System dashboard",
        image_width: 1536,
        image_height: 390
      },
      %{
        number: "02",
        slug: "basketball-system",
        title: "Basketball System",
        summary: "Basketball league system",
        image: ~p"/images/basketball-system-showcase.png",
        alt: "Basketball System dashboard",
        image_width: 1536,
        image_height: 300
      },
      %{
        number: "03",
        slug: "aisof",
        title: "AISOF",
        summary: "Government procurement system",
        image: ~p"/images/aisof-showcase.png",
        alt: "AISOF procurement system dashboard",
        image_width: 1536,
        image_height: 334
      }
    ]
  end
end
