import Config

config :porcelain, driver: Porcelain.Driver.Basic

config :remindme,
  token: System.get_env("DISCORD_TOKEN") || "<YOUR TOKEN HERE>"
