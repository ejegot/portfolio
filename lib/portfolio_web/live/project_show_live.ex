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
    <div class="space-y-16">
      <div>
        <.link
          navigate={~p"/projects"}
          class="text-sm text-zinc-500 hover:text-zinc-900"
        >
          ← Back to Projects
        </.link>
      </div>

      <section class="space-y-5">
        <p class="text-sm font-medium tracking-wide text-zinc-500 uppercase">
          Project
        </p>
        <h1 class="text-3xl font-semibold tracking-tight text-zinc-900 sm:text-4xl">
          {@project.name}
        </h1>
        <p :if={@project.short_description != ""} class="max-w-2xl text-base leading-relaxed text-zinc-600 sm:text-lg">
          {@project.short_description}
        </p>
      </section>

      <section>
        <dl class="space-y-5 border-t border-zinc-100 pt-10">
          <div class="space-y-1">
            <dt class="text-sm font-medium text-zinc-900">Technologies</dt>
            <dd class="text-sm leading-relaxed text-zinc-600">
              {display(@project.technologies)}
            </dd>
          </div>
          <div class="space-y-1">
            <dt class="text-sm font-medium text-zinc-900">What I built</dt>
            <dd class="text-sm leading-relaxed text-zinc-600">
              {display(@project.what_i_built)}
            </dd>
          </div>
          <div class="space-y-1">
            <dt class="text-sm font-medium text-zinc-900">What I learned</dt>
            <dd class="text-sm leading-relaxed text-zinc-600">
              {display(@project.what_i_learned)}
            </dd>
          </div>
          <div class="space-y-1">
            <dt class="text-sm font-medium text-zinc-900">Challenges</dt>
            <dd class="text-sm leading-relaxed text-zinc-600">
              {display(@project.challenges)}
            </dd>
          </div>
          <div class="space-y-1">
            <dt class="text-sm font-medium text-zinc-900">Current status</dt>
            <dd class="text-sm leading-relaxed text-zinc-600">
              {display(@project.current_status)}
            </dd>
          </div>
        </dl>
      </section>
    </div>
    """
  end

  defp display(""), do: "—"
  defp display(value), do: value

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
