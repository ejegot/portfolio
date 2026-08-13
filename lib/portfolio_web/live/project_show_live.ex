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
    <div class="space-y-16 sm:space-y-20">
      <div class="pt-2">
        <.link
          navigate={~p"/projects"}
          class="group inline-flex items-center gap-1.5 text-sm text-zinc-400 transition-colors duration-200 hover:text-zinc-950"
        >
          <span class="transition-transform duration-200 group-hover:-translate-x-0.5">←</span>
          Back to projects
        </.link>
      </div>

      <header class="space-y-6 sm:space-y-8">
        <h1 class="font-display text-4xl font-semibold tracking-display text-zinc-950 sm:text-5xl sm:leading-[1.05] lg:text-6xl">
          {@project.name}
        </h1>
        <p
          :if={@project.short_description != ""}
          class="max-w-xl text-lg leading-snug text-zinc-600 sm:text-xl sm:leading-snug"
        >
          {@project.short_description}
        </p>
        <p
          :if={@project.technologies != ""}
          class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase"
        >
          {@project.technologies}
        </p>
      </header>

      <section class="border-t border-zinc-200">
        <div
          :if={@project.short_description != ""}
          class="space-y-3 border-b border-zinc-200 py-10 sm:py-14"
        >
          <h2 class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase">
            Overview
          </h2>
          <p class="text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.short_description}
          </p>
        </div>

        <div class="space-y-3 border-b border-zinc-200 py-10 sm:py-14">
          <h2 class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase">
            What I built
          </h2>
          <p class="text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.what_i_built}
          </p>
        </div>

        <div class="space-y-3 border-b border-zinc-200 py-10 sm:py-14">
          <h2 class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase">
            What I learned
          </h2>
          <p class="text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.what_i_learned}
          </p>
        </div>

        <div class="space-y-3 border-b border-zinc-200 py-10 sm:py-14">
          <h2 class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase">
            Challenges
          </h2>
          <p class="text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.challenges}
          </p>
        </div>

        <div
          :if={@project.current_status != ""}
          class="space-y-3 border-b border-zinc-200 py-10 sm:py-14"
        >
          <h2 class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase">
            Current status
          </h2>
          <p class="text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
            {@project.current_status}
          </p>
        </div>
      </section>
    </div>
    """
  end

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
        technologies: "Elixir · Phoenix LiveView · PostgreSQL · Tailwind CSS",
        what_i_built:
          "I built a gym management system to track gym records and help gym businesses manage their operations.",
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
          "A basketball system that can track player and game statistics, provide online registration, and help manage the operations of a basketball league.",
        technologies: "Elixir · Phoenix LiveView · PostgreSQL · Tailwind CSS",
        what_i_built:
          "I built a basketball system that can track player and game statistics, provide online registration, and help manage the operations of a basketball league.",
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
        technologies: "",
        what_i_built:
          "I worked on a procurement system covering Purchase Requests, Supplier Management, Requests for Quotation, Canvassing and Quotations, Purchase Orders, Approvals, Procurement Tracking, and Reports.",
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
        technologies: "Elixir · Phoenix LiveView",
        what_i_built:
          "A personal learning portfolio with Home, Learning Journey, and Projects pages using Phoenix LiveView.",
        what_i_learned:
          "How the Phoenix router connects routes to LiveViews, how mount/3 assigns data to the socket, and how HEEx renders assigned data.",
        challenges:
          "A Tailwind download/TLS certificate issue on Erlang 27.1.3, resolved by updating Erlang to 27.3.",
        current_status: "In progress — documenting the coding journey as I build."
      }
    ]
  end
end
