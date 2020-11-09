defmodule Remindme.Bot do
  @moduledoc false

  use Application

  alias Alchemy.Client

  @impl true
  def start(_type, _args) do
    run =
      :bot
      |> Application.fetch_env!(:token)
      |> Client.start()

    use Remindme.Bot.Commands
    run
  end
end
