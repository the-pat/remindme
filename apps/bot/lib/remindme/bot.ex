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

  def send_reminder(channel_id, content) do
    Client.send_message(channel_id, content)
  end
end
