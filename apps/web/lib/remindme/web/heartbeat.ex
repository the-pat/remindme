defmodule Remindme.Web.Heartbeat do
  use GenServer

  def start_link(_args) do
    url = :web |> Application.fetch_env!(:heartbeat_url)
    GenServer.start_link(__MODULE__, url)
  end

  def init(url) do
    Application.ensure_all_started(:hackney)
    schedule_message()
    {:ok, url}
  end

  def handle_info(:heartbeat, url) do
    schedule_message()
    _ = :hackney.get(url)
    {:noreply, url}
  end

  defp schedule_message() do
    Process.send_after(self(), :heartbeat, :timer.minutes(20))
  end
end
