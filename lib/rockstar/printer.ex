defmodule Rockstar.Printer do
  @doc """
  Output an AST command into valid Elixir code.

  iex> Printer.print({:comment, "Hello world!"})
  "# Hello world!"

  iex> Printer.print({:assign, "my world", "something cool"})
  "my_world = \\"something cool\\""

  iex> Printer.print({:assign, "Sally", 12})
  "sally = 12"
  """
  def print({:comment, comment}), do: "# " <> comment

  def print({:assign, variable, value}) do
    string_to_variable_name(variable) <> " = #{wrap_string(value)}"
  end

  def print(line), do: line

  defp string_to_variable_name(name) do
    name
    |> String.replace(" ", "_")
    |> String.downcase()
  end

  defp wrap_string(value) when is_binary(value), do: "\"" <> value <> "\""
  defp wrap_string(value), do: value
end
