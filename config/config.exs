import Config

config :porcelain, driver: Porcelain.Driver.Basic

config :bot,
  token: System.get_env("DISCORD_TOKEN")

config :persistence,
  ecto_repos: [Remindme.Persistence.Repo]

config :persistence, Oban,
  repo: Remindme.Persistence.Repo,
  crontab: false,
  queues: [reminder: 5]

config :web,
  port: System.get_env("PORT")

config :logger, :console,
  level: :info,
  format: "$date $time [$level] $metadata$message\n",
  metadata: [:user_id]

import_config "#{Mix.env()}.exs"
