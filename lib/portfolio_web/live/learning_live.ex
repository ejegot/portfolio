defmodule PortfolioWeb.LearningLive do
  use PortfolioWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Learning")
      |> assign(:entries, entries())

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="space-y-16 sm:space-y-20">
      <section class="space-y-6 pt-2 sm:pt-6">
        <h1 class="font-display text-4xl font-semibold tracking-display text-zinc-950 sm:text-5xl sm:leading-[1.05] lg:text-6xl">
          LEARNING JOURNEY
        </h1>
        <p class="max-w-md text-base leading-relaxed text-zinc-600 sm:text-lg">
          Documenting what I learn while building real systems.
        </p>
      </section>

      <section>
        <ol class="border-t border-zinc-200">
          <li
            :for={entry <- @entries}
            class="space-y-8 border-b border-zinc-200 py-12 sm:space-y-10 sm:py-16"
          >
            <header class="space-y-4">
              <time
                class="block text-xs font-medium tracking-[0.16em] text-zinc-400 uppercase"
                datetime={Date.to_iso8601(entry.date)}
              >
                {Calendar.strftime(entry.date, "%B %-d, %Y")}
              </time>
              <h2 class="font-display text-2xl font-semibold tracking-display text-zinc-950 sm:text-3xl sm:leading-snug">
                {entry.title}
              </h2>
            </header>

            <dl class="space-y-7">
              <div class="space-y-2">
                <dt class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase">
                  What I learned
                </dt>
                <dd class="text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
                  {entry.what_i_learned}
                </dd>
              </div>
              <div class="space-y-2">
                <dt class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase">
                  What I built
                </dt>
                <dd class="text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
                  {entry.what_i_built}
                </dd>
              </div>
              <div class="space-y-2">
                <dt class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase">
                  What I struggled with
                </dt>
                <dd class="text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
                  {entry.what_i_struggled_with}
                </dd>
              </div>
              <div class="space-y-2">
                <dt class="text-xs font-medium tracking-[0.14em] text-zinc-400 uppercase">
                  Next step
                </dt>
                <dd class="text-base leading-relaxed text-zinc-600 sm:text-lg sm:leading-relaxed">
                  {entry.next_step}
                </dd>
              </div>
            </dl>
          </li>
        </ol>
      </section>
    </div>
    """
  end

  defp entries do
    [
      %{
        date: ~D[2026-08-11],
        title: "Learning Journey page",
        what_i_learned:
          "How to document a coding journey in a LiveView using hardcoded entry data — without a database, schema, or API.",
        what_i_built:
          "The Learning Journey page at /learning, with chronological entries and navigation from the shared header.",
        what_i_struggled_with: "—",
        next_step: "Continue adding entries here as I keep learning."
      },
      %{
        date: ~D[2026-08-11],
        title: "Portfolio homepage with LiveView",
        what_i_learned:
          "How the Phoenix router connects \"/\" to HomeLive, how mount/3 assigns data to the socket, and how HEEx renders that assigned data. I used Cursor with a plan → review → implementation workflow to build the page.",
        what_i_built:
          "The portfolio homepage: a short introduction, a currently learning section, and featured projects.",
        what_i_struggled_with: "—",
        next_step: "Build a Learning Journey page to log progress over time."
      },
      %{
        date: ~D[2026-08-11],
        title: "Started the Phoenix portfolio project",
        what_i_learned:
          "How to start a new Phoenix LiveView portfolio project and set it up with Elixir 1.17.3, Phoenix 1.7.x, and PostgreSQL.",
        what_i_built: "The initial Phoenix LiveView portfolio project for this site.",
        what_i_struggled_with:
          "A Tailwind download/TLS certificate issue on Erlang 27.1.3. Resolved by updating Erlang to 27.3.",
        next_step: "Build the homepage with LiveView."
      }
    ]
  end
end
