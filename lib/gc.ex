defmodule Gc do
  use Application
  require Logger

  def start( _type, _args ) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Gc.Repo, []),
      worker(__MODULE__, [], function: :run)
    ]

    opts = [strategy: :one_for_one, name: Gc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run do
    { :ok, _ } = Plug.Adapters.Cowboy.http Gc.Router, [], port: server_port
  end

  defp server_port do
    port = Application.get_env(:gc, :cowboy_port)
    Logger.info "Application will be running on port #{port}"
    port
  end
end
