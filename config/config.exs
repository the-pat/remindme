import Config

config :porcelain, driver: Porcelain.Driver.Basic

config :bot,
  token: System.get_env("DISCORD_TOKEN") || "<YOUR TOKEN HERE>"

config :web,
  port: System.get_env("PORT") || "4001"

config :logger, :console,
  level: :info,
  format: "$date $time [$level] $metadata$message\n",
  metadata: [:user_id]
