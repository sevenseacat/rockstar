defmodule Rockstar.Variable do
  @common_prefixes ~w(a an the my your)

  @doc """
  Checks if the provided string is a valid common variable name.

  iex> Variable.common_name?(true)
  false

  iex> Variable.common_name?(-1)
  false

  iex> Variable.common_name?("my heart")
  true

  iex> Variable.common_name?("your soul")
  true

  iex> Variable.common_name?("myotherapy")
  false

  iex> Variable.common_name?("the world")
  true

  iex> Variable.common_name?("a star")
  true

  iex> Variable.common_name?("a Star")
  false

  iex> Variable.common_name?("an angel")
  true

  iex> Variable.common_name?("An Angel")
  false

  iex> Variable.common_name?("anna")
  false
  """
  def common_name?(name) when is_binary(name) do
    name == String.downcase(name) &&
      Enum.any?(@common_prefixes, fn prefix ->
        String.starts_with?(name, prefix <> " ")
      end)
  end

  def common_name?(_name), do: false

  @doc """
  Checks if the provided string is a valid proper variable name.

  iex> Variable.proper_name?("hello")
  false

  iex> Variable.proper_name?("Hello")
  true

  iex> Variable.proper_name?("Hello world")
  false

  iex> Variable.proper_name?("Hello World")
  true

  iex> Variable.proper_name?(12)
  false
  """
  def proper_name?(name) when is_binary(name) do
    name
    |> String.split()
    |> Enum.all?(fn word -> word == String.capitalize(word) end)
  end

  def proper_name?(_), do: false
end
