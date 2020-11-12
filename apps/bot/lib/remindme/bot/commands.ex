defmodule Remindme.Bot.Commands do
  use Alchemy.Cogs

  require Logger

  alias Alchemy.Client
  alias Remindme.Bot.Time

  @help_text """
  Commands:
  - `!remindme h(elp)`: prints this command text
  - `!remindme 30 [(default) second(s) | minute(s) | hour(s) | day(s) | week(s)]`: sends a reminder to the user
  - `!ping`: `pong`
  """

  Cogs.def ping do
    Logger.info(message.content)
    Cogs.say("pong!")
  end

  Cogs.def remindme("h") do
    Logger.info(message.content)
    Cogs.say(@help_text)
  end

  Cogs.def remindme("help") do
    Logger.info(message.content)
    Cogs.say(@help_text)
  end

  Cogs.def remindme(_) do
    Logger.info(message.content)
    ["!remindme", time | rest] = String.split(message.content)

    unit =
      case rest do
        [unit | _] -> unit
        _ -> "seconds"
      end

    milliseconds = Time.parse_time(time, unit)

    cond do
      milliseconds < 0 -> send_error_message(message)
      true -> schedule_reminder_message(message, milliseconds)
    end
  end

  defp send_error_message(message) do
    Client.send_message(
      message.channel_id,
      """
      Congrats, <@#{message.author.id}>. You broke it.
      ```erlang
      ** (ErlangError) Erlang error: :timeout_value
          (stdlib 3.13.2) timer.erl:152: :timer.sleep/1
      ```
      """
    )
  end

  defp schedule_reminder_message(message, milliseconds) do
    {:ok, channel} = Client.get_channel(message.channel_id)
    {:ok, private_channel} = Client.create_DM(message.author.id)

    Remindme.Persistence.Worker.insert(
      private_channel.id,
      """
      <@#{message.author.id}> here's your reminder!

      https://discord.com/channels/#{channel.guild_id}/#{channel.id}/#{message.id}
      """,
      milliseconds
    )

    Cogs.say("<@#{message.author.id}>, no problem!")
  end
end
