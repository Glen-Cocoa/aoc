file = File.read!("./input.txt")

defmodule Extractor do
  def numbers(input) do
  Regex.replace(~r/[^0-9]/, input, "")
    |> first_and_last()
  end

  defp first_and_last(numbers), do: "#{String.at(numbers, 0)}#{String.at(numbers, -1)}"
end

defmodule Splitter do
  def lines(input) do
    input
    |> String.split("\n", trim: true)
  end
end

file
|> Splitter.lines()
|> Enum.map(&Extractor.numbers/1)
|> Enum.reduce(0, fn str, acc ->
  acc + String.to_integer(str)
end)
|> IO.inspect()
