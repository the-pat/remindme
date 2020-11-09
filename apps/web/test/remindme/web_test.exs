defmodule Remindme.WebTest do
  use ExUnit.Case
  doctest Remindme.Web

  test "greets the world" do
    assert Remindme.Web.hello() == :world
  end
end
