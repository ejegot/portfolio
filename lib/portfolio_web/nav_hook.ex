defmodule PortfolioWeb.NavHook do
  @moduledoc false
  import Phoenix.Component
  import Phoenix.LiveView

  def on_mount(:default, _params, _session, socket) do
    socket =
      socket
      |> assign(:current_path, "/")
      |> attach_hook(:assign_current_path, :handle_params, &handle_params/3)

    {:cont, socket}
  end

  defp handle_params(_params, uri, socket) do
    path = URI.parse(uri).path || "/"
    {:cont, assign(socket, :current_path, path)}
  end
end
