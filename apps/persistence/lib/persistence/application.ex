defmodule Remindme.Persistence.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Remindme.Persistence.Repo

  @impl true
  def start(_type, _args) do
    children = [
      Repo,
      {Oban, oban_config()}
      # Starts a worker by calling: Persistence.Worker.start_link(arg)
      # {Persistence.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Persistence.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp oban_config() do
    Application.get_env(:persistence, Oban)
  end
end
