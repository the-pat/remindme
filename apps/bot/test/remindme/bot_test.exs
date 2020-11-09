defmodule Remindme.BotTest do
  use ExUnit.Case
  doctest Remindme.Bot

  test "greets the world" do
    assert Remindme.Bot.hello() == :world
  end
end
