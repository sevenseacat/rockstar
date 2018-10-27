defmodule Rockstar do
  def convert(filename) do
    filename
    |> load_file
    |> build_ast
    |> to_ex
  end

  defp load_file(filename) do
    {:ok, code} = File.read(filename)

    code
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
  end

  defp build_ast(lines) do
    lines
    |> Enum.map(&Rockstar.Parser.parse/1)
    |> List.flatten()
  end

  defp to_ex(commands) do
    commands
    |> Enum.map(&Rockstar.Printer.print/1)
  end
end
