import Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :persistence, Remindme.Persistence.Repo,
  ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :persistence, Oban,
  repo: Remindme.Persistence.Repo,
  crontab: false,
  queues: [reminder: String.to_integer(System.get_env("POOL_SIZE") || "5")]
