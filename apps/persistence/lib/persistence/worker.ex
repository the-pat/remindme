defmodule Remindme.Persistence.Worker do
  use Oban.Worker,
    queue: :reminder,
    max_attempts: 5

  require Logger

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"channel_id" => channel_id, "content" => content}}) do
    Logger.info("START")
    # TODO: figure out a better way to handle communication between applications in the
    #   same umbrella project. Maybe send a message to a PID?
    apply(Remindme.Bot, :send_reminder, [channel_id, content])
    Logger.info("END")

    :ok
  end

  def insert(channel_id, content, milliseconds) do
    %{channel_id: channel_id, content: content}
    |> new(schedule_in: div(milliseconds, 1000))
    |> Oban.insert()
  end
end
