defmodule PortfolioWeb.ProjectShowLive do
  use PortfolioWeb, :live_view

  defmodule NotFoundError do
    defexception message: "Project not found", plug_status: 404
  end

  @impl true
  def mount(%{"slug" => slug}, _session, socket) do
    case get_project(slug) do
      nil ->
        raise NotFoundError

      project ->
        socket =
          socket
          |> assign(:page_title, project.name)
          |> assign(:project, project)

        {:ok, socket}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-w-0 space-y-12 sm:space-y-20">
      <div class="pt-1 sm:pt-2">
        <.link
          navigate={~p"/projects"}
          class="group inline-flex min-h-11 items-center gap-1.5 text-sm text-zinc-400 transition-colors duration-200 hover:text-zinc-950 sm:min-h-0"
        >
          <span class="transition-transform duration-200 group-hover:-translate-x-0.5">←</span>
          Back to projects
        </.link>
      </div>

      <header class="space-y-5 sm:space-y-8">
        <h1 class="break-words font-display text-3xl font-semibold leading-tight tracking-display text-zinc-950 sm:text-5xl sm:leading-[1.05] lg:text-6xl">
          {@project.name}
        </h1>
        <p
          :if={@project.short_description != ""}
          class="max-w-xl text-base leading-relaxed text-zinc-600 sm:text-xl sm:leading-snug"
        >
          {@project.short_description}
        </p>
        <p :if={@project.technologies != ""} class="detail-label break-words">
          {@project.technologies}
        </p>
        <a
          :if={link = project_link(@project.slug)}
          href={link.href}
          target="_blank"
          rel="noopener noreferrer"
          class="group inline-flex min-h-11 items-center gap-2 text-sm font-medium tracking-wide text-zinc-950 transition-opacity duration-200 hover:opacity-60 sm:min-h-0"
        >
          <span class="underline decoration-zinc-300 underline-offset-4 transition-colors duration-200 group-hover:decoration-zinc-950">
            {link.label}
          </span>
          <span class="transition-transform duration-200 group-hover:translate-x-0.5">→</span>
        </a>
      </header>

      <section class="border-t border-zinc-200">
        <div
          :if={@project.overview != ""}
          class="space-y-3 border-b border-zinc-200 py-8 sm:space-y-4 sm:py-12"
        >
          <h2 class="detail-label">
            Overview
          </h2>
          <p class="break-words text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.overview}
          </p>
        </div>

        <div class="space-y-3 border-b border-zinc-200 py-8 sm:space-y-4 sm:py-12">
          <h2 class="detail-label">
            What I built
          </h2>
          <p class="break-words text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.what_i_built}
          </p>
        </div>

        <div
          :if={@project.key_features != []}
          class="space-y-3 border-b border-zinc-200 py-8 sm:space-y-4 sm:py-12"
        >
          <h2 class="detail-label">
            Key Features
          </h2>
          <ul class="space-y-2 text-base leading-relaxed text-zinc-600 sm:space-y-2.5 sm:text-lg sm:leading-relaxed">
            <li :for={feature <- @project.key_features} class="break-words">{feature}</li>
          </ul>
        </div>

        <div
          :if={visual = project_visual(@project.slug)}
          class="space-y-3 border-b border-zinc-200 py-8 sm:space-y-4 sm:py-12"
        >
          <h2 class="detail-label">
            Project Visual
          </h2>
          <div class="page-visual">
            <img
              src={visual.src}
              alt={visual.alt}
              width={visual.width}
              height={visual.height}
              class="page-visual-img"
            />
          </div>
        </div>

        <div class="space-y-3 border-b border-zinc-200 py-8 sm:space-y-4 sm:py-12">
          <h2 class="detail-label">
            What I learned
          </h2>
          <p class="break-words text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.what_i_learned}
          </p>
        </div>

        <div class="space-y-3 border-b border-zinc-200 py-8 sm:space-y-4 sm:py-12">
          <h2 class="detail-label">
            Challenges
          </h2>
          <p class="break-words text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.challenges}
          </p>
        </div>

        <div
          :if={@project.current_status != ""}
          class="space-y-3 border-b border-zinc-200 py-8 sm:space-y-4 sm:py-12"
        >
          <h2 class="detail-label">
            Current status
          </h2>
          <p class="break-words text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.current_status}
          </p>
        </div>
      </section>
    </div>
    """
  end

  defp project_visual("gym-system") do
    %{
      src: ~p"/images/gym-system-showcase.png",
      alt: "Gym System dashboard",
      width: 1536,
      height: 390
    }
  end

  defp project_visual("basketball-system") do
    %{
      src: ~p"/images/basketball-system-showcase.png",
      alt: "Basketball System dashboard",
      width: 1536,
      height: 300
    }
  end

  defp project_visual("aisof") do
    %{
      src: ~p"/images/aisof-showcase.png",
      alt: "AISOF procurement system dashboard",
      width: 1536,
      height: 334
    }
  end

  defp project_visual(_slug), do: nil

  defp project_link("gym-system") do
    %{href: "https://github.com/ejegot/gym", label: "View source"}
  end

  defp project_link("basketball-system") do
    %{href: "https://ligahoops.com", label: "View live site"}
  end

  defp project_link(_slug), do: nil

  defp get_project(slug), do: Map.get(projects_by_slug(), slug)

  defp projects_by_slug do
    Map.new(projects(), &{&1.slug, &1})
  end

  defp projects do
    [
      %{
        slug: "gym-system",
        name: "Gym System",
        short_description:
          "A gym management system to track gym records and help gym businesses manage their operations.",
        overview:
          "A gym management system to track gym records and help gym businesses manage their operations.",
        technologies: "Elixir · Phoenix LiveView · PostgreSQL · Tailwind CSS",
        what_i_built:
          "I built a gym management system to track gym records and help gym businesses manage their operations.",
        key_features: [
          "Member Management",
          "Membership Management",
          "Payments and Receipts",
          "Attendance Tracking",
          "Staff and Roles",
          "Branch Management",
          "Notifications",
          "QR Check-in",
          "Digital Member ID",
          "Reports"
        ],
        what_i_learned:
          "I learned how to build a system from scratch, use Elixir to develop an application, and work with a database to store and manage data.",
        challenges:
          "My biggest challenge was not knowing where to start. I had to learn how to break a large system into smaller parts and build it step by step.",
        current_status: ""
      },
      %{
        slug: "basketball-system",
        name: "Basketball System",
        short_description:
          "A basketball system that can track player and game statistics and provide online registration for running a basketball league.",
        overview:
          "A basketball system that can track stats and support online registration for running a basketball league.",
        technologies: "Elixir · Phoenix LiveView · PostgreSQL · Tailwind CSS",
        what_i_built:
          "I built a basketball system that can track statistics and handle online registration to help run a basketball league.",
        key_features: [
          "Player Statistics",
          "Team Management",
          "Game Statistics",
          "Online Registration",
          "League Management"
        ],
        what_i_learned:
          "I learned how to build a system from scratch, use Elixir to develop an application, and work with a database to store and manage data.",
        challenges:
          "My biggest challenge was not knowing where to start. I had to learn how to break a large system into smaller parts and build it step by step.",
        current_status: ""
      },
      %{
        slug: "aisof",
        name: "AISOF",
        short_description:
          "An end-to-end procurement system designed to support government organizations in managing their procurement processes.",
        overview:
          "An end-to-end procurement system designed to support government organizations in managing their procurement processes.",
        technologies: "",
        what_i_built:
          "I worked on a procurement system covering Purchase Requests, Supplier Management, Requests for Quotation, Canvassing and Quotations, Purchase Orders, Approvals, Procurement Tracking, and Reports.",
        key_features: [
          "Purchase Requests",
          "Supplier Management",
          "Requests for Quotation",
          "Canvassing and Quotations",
          "Purchase Orders",
          "Approvals",
          "Procurement Tracking",
          "Reports"
        ],
        what_i_learned:
          "I learned how to build a procurement system and how the procurement process works in practice.",
        challenges:
          "My biggest challenge was that procurement was new to me. I had to first understand how the procurement process works before I could build and use the system.",
        current_status: ""
      },
      %{
        slug: "learning-portfolio",
        name: "Learning Portfolio",
        short_description: "This portfolio documents my coding journey and learning process.",
        overview: "This portfolio documents my coding journey and learning process.",
        technologies: "Elixir · Phoenix LiveView",
        what_i_built:
          "A personal learning portfolio with Home, Learning Journey, and Projects pages using Phoenix LiveView.",
        key_features: [],
        what_i_learned:
          "How the Phoenix router connects routes to LiveViews, how mount/3 assigns data to the socket, and how HEEx renders assigned data.",
        challenges:
          "A Tailwind download/TLS certificate issue on Erlang 27.1.3, resolved by updating Erlang to 27.3.",
        current_status: "In progress — documenting the coding journey as I build."
      }
    ]
  end
end
