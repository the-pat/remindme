defmodule Remindme.Utils do
  def parse_time(time) do
    cond do
      String.contains?(time, "second") ->
        [seconds | _] = String.split(time)
        parse_seconds(seconds)

      true ->
        parse_seconds(time)
    end
  end

  defp parse_seconds(seconds) do
    {seconds, _} = Integer.parse(seconds)
    :timer.seconds(seconds)
  end
end
