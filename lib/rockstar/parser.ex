defmodule Rockstar.Parser do
  alias Rockstar.Variable

  @doc """
  Parses a line of Rockstar code into an abstract syntax tree.

  Comments are marked with parentheses.

  iex> Parser.parse("(this is a full-line comment)")
  {:comment, "this is a full-line comment"}

  Assignment is done with "put X into Y", given X is a numeric or string
  literal and Y is a common or proper variable name.

  iex> Parser.parse("Put 123 into my heart")
  {:assign, "my heart", 123}
  """
  def parse("(" <> comment), do: {:comment, String.slice(comment, 0..-2)}

  def parse("Put " <> assignment) do
    {value, variable} = read_literal(assignment)
    {:assign, variable, value}
  end

  def parse(line), do: line

  defp read_literal("\"" <> string) do
    [value | rest] = String.split(string, "\"")
    {value, get_variable_name(hd(rest))}
  end

  defp read_literal(string) do
    case Float.parse(string) do
      {float, rest} ->
        value = maybe_int(float)
        {value, get_variable_name(rest)}

      :error ->
        raise ArgumentError, "Invalid assignment value"
    end
  end

  # Ensure the rest contains a valid variable name.
  defp get_variable_name(string) do
    name = String.trim_leading(string, " into ")

    if Variable.valid_name?(name) do
      name
    else
      raise ArgumentError, "Invalid variable name"
    end
  end

  defp maybe_int(float) do
    int = trunc(float)
    if int == float, do: int, else: float
  end
end
