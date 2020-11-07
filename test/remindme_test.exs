defmodule RemindmeTest do
  use ExUnit.Case
  doctest Remindme

  test "greets the world" do
    assert Remindme.hello() == :world
  end
end
