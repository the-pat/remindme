defmodule Remindme.Bot.Repo do
  use Ecto.Repo,
    otp_app: :bot,
    adapter: Ecto.Adapters.Postgres
end
