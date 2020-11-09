defmodule Remindme.Bot.Commands do
  use Alchemy.Cogs

  alias Alchemy.Client
  alias Remindme.Bot.Time

  @help_text """
  Commands:
  - `!remindme h(elp)`: prints this command text
  - `!remindme 30 [(default) second(s) | minute(s) | hour(s) | day(s) | week(s)]`: sends a reminder to the user
      note: longer reminders will not work if the app falls asleep _or_ is restarted

  Wake up link: https://patrickt-remindme.herokuapp.com/
  """

  Cogs.def ping do
    Cogs.say("pong!")
  end

  Cogs.def remindme("h") do
    Cogs.say(@help_text)
  end

  Cogs.def remindme("help") do
    Cogs.say(@help_text)
  end

  Cogs.def remindme(_) do
    ["!remindme", time | rest] = String.split(message.content)

    unit =
      case rest do
        [unit | _] -> unit
        _ -> "seconds"
      end

    milliseconds = Time.parse_time(time, unit)

    {:ok, channel} = Client.get_channel(message.channel_id)
    {:ok, private_channel} = Client.create_DM(message.author.id)

    spawn(fn ->
      :timer.sleep(milliseconds)

      Client.send_message(
        private_channel.id,
        """
        <@#{message.author.id}> here's your reminder!

        https://discord.com/channels/#{channel.guild_id}/#{channel.id}/#{message.id}
        """
      )
    end)

    Cogs.say("<@#{message.author.id}>, no problem!")
  end
end
