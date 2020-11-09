defmodule Remindme.Utils do
  def parse_time(time, unit) do
    cond do
      String.contains?(unit, "week") ->
        to_milliseconds(:hours, time) * 24 * 7

      String.contains?(unit, "day") ->
        to_milliseconds(:hours, time) * 24

      String.contains?(unit, "hour") ->
        to_milliseconds(:hours, time)

      String.contains?(unit, "minute") ->
        to_milliseconds(:minutes, time)

      String.contains?(unit, "second") ->
        to_milliseconds(:seconds, time)

      true ->
        to_milliseconds(:seconds, time)
    end
  end

  defp to_milliseconds(unit, time) do
    {time, _} = Integer.parse(time)
    apply(:timer, unit, [time])
  end
end
