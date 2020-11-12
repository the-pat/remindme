import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :persistence, Remindme.Persistence.Repo,
  username: "postgres",
  password: "postgres",
  database: "remindme_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :persistence, Oban, crontab: false, queues: false, plugins: false
