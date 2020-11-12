defmodule PersistenceTest do
  use ExUnit.Case
  doctest Persistence

  test "greets the world" do
    assert Persistence.hello() == :world
  end
end
