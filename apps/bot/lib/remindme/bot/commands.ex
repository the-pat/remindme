defmodule Remindme.Bot.Commands do
  use Alchemy.Cogs

  alias Alchemy.Client
  alias Remindme.Bot.Time

  Cogs.def ping do
    Cogs.say("pong!")
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
