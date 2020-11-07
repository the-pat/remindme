import Config

config :porcelain, driver: Porcelain.Driver.Basic

config :remindme,
  token: "<YOUR TOKEN HERE>"

import_config "config.secret.exs"
