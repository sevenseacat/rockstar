defmodule RockstarTest do
  use ExUnit.Case
  doctest Rockstar

  test "greets the world" do
    assert Rockstar.hello() == :world
  end
end
