defmodule Rockstar.ParserTest do
  use ExUnit.Case
  alias Rockstar.Parser
  doctest Rockstar.Parser

  test "parsing assignment of strings" do
    assert Parser.parse("Put \"something\" into your soul") == {:assign, "your soul", "something"}

    assert_raise ArgumentError, "Invalid variable name", fn ->
      Parser.parse("Put \"something\" into something else")
    end
  end
end
