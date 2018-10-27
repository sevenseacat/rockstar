defmodule Rockstar.Printer do
  @doc """
  Output an AST command into valid Elixir code.

  iex> Printer.print({:comment, "Hello world!"})
  "# Hello world!"
  """
  def print({:comment, comment}), do: "# " <> comment

  def print(line), do: line
end
