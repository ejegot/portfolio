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
    <div class="space-y-16">
      <section class="space-y-5">
        <p class="text-sm font-medium tracking-wide text-zinc-500 uppercase">
          Learning Portfolio
        </p>
        <h1 class="text-3xl font-semibold tracking-tight text-zinc-900 sm:text-4xl">
          Learning journey
        </h1>
        <p class="max-w-2xl text-base leading-relaxed text-zinc-600 sm:text-lg">
          A chronological log of what I study, what I build, where I get stuck,
          and what I try next. Newest entries first.
        </p>
      </section>

      <section class="space-y-12">
        <article :for={entry <- @entries} class="space-y-5 border-t border-zinc-100 pt-10 first:border-t-0 first:pt-0">
          <header class="space-y-2">
            <time class="text-sm text-zinc-500" datetime={Date.to_iso8601(entry.date)}>
              {Calendar.strftime(entry.date, "%B %-d, %Y")}
            </time>
            <h2 class="text-xl font-semibold tracking-tight text-zinc-900">
              {entry.title}
            </h2>
          </header>

          <dl class="space-y-5">
            <div class="space-y-1">
              <dt class="text-sm font-medium text-zinc-900">What I learned</dt>
              <dd class="text-sm leading-relaxed text-zinc-600">{entry.what_i_learned}</dd>
            </div>
            <div class="space-y-1">
              <dt class="text-sm font-medium text-zinc-900">What I built</dt>
              <dd class="text-sm leading-relaxed text-zinc-600">{entry.what_i_built}</dd>
            </div>
            <div class="space-y-1">
              <dt class="text-sm font-medium text-zinc-900">What I struggled with</dt>
              <dd class="text-sm leading-relaxed text-zinc-600">{entry.what_i_struggled_with}</dd>
            </div>
            <div class="space-y-1">
              <dt class="text-sm font-medium text-zinc-900">Next step</dt>
              <dd class="text-sm leading-relaxed text-zinc-600">{entry.next_step}</dd>
            </div>
          </dl>
        </article>
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
