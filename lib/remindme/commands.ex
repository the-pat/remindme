defmodule Remindme.Commands do
  use Alchemy.Cogs

  alias Alchemy.Client

  Cogs.def ping do
    Cogs.say("pong!")
  end

  Cogs.def remindme(time) do
    {time, _} = Integer.parse(time)

    spawn(fn ->
      :timer.sleep(:timer.seconds(time))

      Client.send_message(
        message.channel_id,
        "<@#{message.author.id}> here's your reminder!"
      )
    end)

    Cogs.say("<@#{message.author.id}>, we will remind you")
  end
end
