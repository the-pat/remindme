defmodule Remindme.Bot.MixProject do
  use Mix.Project

  def project do
    [
      app: :bot,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Remindme.Bot, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:alchemy, "~> 0.6.4", hex: :discord_alchemy}]
  end
end
