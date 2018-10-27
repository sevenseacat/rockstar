defmodule Rockstar.Parser do
  @doc """
  Parses a line of Rockstar code into an intermediate readable format.

  iex> Parser.parse("(this is a full-line comment)")
  {:comment, "this is a full-line comment"}
  """
  def parse("(" <> comment), do: {:comment, String.slice(comment, 0..-2)}

  def parse(line), do: line
end
