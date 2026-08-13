defmodule PortfolioWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use PortfolioWeb, :controller` and
  `use PortfolioWeb, :live_view`.
  """
  use PortfolioWeb, :html

  embed_templates "layouts/*"

  attr :href, :string, required: true
  attr :current_path, :string, required: true
  attr :match, :string, required: true
  slot :inner_block, required: true

  def nav_link(assigns) do
    ~H"""
    <a
      href={@href}
      class={[
        "text-sm tracking-wide transition-colors duration-200",
        nav_active?(@current_path, @match) && "text-zinc-950",
        !nav_active?(@current_path, @match) && "text-zinc-400 hover:text-zinc-950"
      ]}
    >
      {render_slot(@inner_block)}
    </a>
    """
  end

  defp nav_active?(path, "/"), do: path == "/"

  defp nav_active?(path, "/projects") do
    path == "/projects" or String.starts_with?(path, "/projects/")
  end

  defp nav_active?(path, match), do: path == match
end
