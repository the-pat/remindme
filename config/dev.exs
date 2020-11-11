import Config

config :bot, Remindme.Bot.Repo,
  username: "postgres",
  password: "postgres",
  database: "remindme_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :web,
  port: "4001",
  heartbeat_url: "http://localhost:4001"

import_config "dev.secret.exs"
