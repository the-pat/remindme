import Config

config :web,
  port: "4001",
  heartbeat_url: "http://localhost:4001"

import_config "dev.secret.exs"
