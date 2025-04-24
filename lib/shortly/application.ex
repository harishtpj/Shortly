defmodule Shortly.Application do
  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, scheme: :http, plug: Shortly, port: 5000}
    ]

    opts = [strategy: :one_for_one, name: Shortly.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
