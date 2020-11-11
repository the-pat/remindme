defmodule Remindme.Web.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    {port, _} = :web |> Application.fetch_env!(:port) |> Integer.parse()

    children = [
      {Plug.Cowboy, scheme: :http, plug: Remindme.Web.Router, options: [port: port]}
      # Remindme.Web.Heartbeat
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Remindme.Web.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
