import Config

config :porcelain, driver: Porcelain.Driver.Basic

config :bot,
  ecto_repos: [Remindme.Bot.Repo],
  token: System.get_env("DISCORD_TOKEN")

config :web,
  port: System.get_env("PORT")

config :logger, :console,
  level: :info,
  format: "$date $time [$level] $metadata$message\n",
  metadata: [:user_id]

import_config "#{Mix.env()}.exs"
