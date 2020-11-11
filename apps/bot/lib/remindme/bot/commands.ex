defmodule Remindme.Bot.Commands do
  use Alchemy.Cogs

  alias Alchemy.Client
  alias Remindme.Bot.Time

  @help_text """
  Commands:
  - `!remindme h(elp)`: prints this command text
  - `!remindme 30 [(default) second(s) | minute(s) | hour(s) | day(s) | week(s)]`: sends a reminder to the user
      _Note: Long running reminders are unreliable at this point. A persistant job store is in progress._
  - `!ping`: `pong`
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

    cond do
      milliseconds < 0 ->
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

      true ->
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
end
