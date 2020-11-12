defmodule Remindme.Persistence.Repo do
  use Ecto.Repo,
    otp_app: :persistence,
    adapter: Ecto.Adapters.Postgres
end
