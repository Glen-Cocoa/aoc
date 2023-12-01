defmodule Extractor do

  def numbers(input) do
    input
    |> String.replace(~r/[^0-9]/, "")
    |> first_and_last()
  end

  defp first_and_last(""), do: ""
  defp first_and_last(numbers), do: "#{String.at(numbers, 0)}#{String.at(numbers, -1)}"
end

defmodule Splitter do
  def lines(input) do
    input
    |> String.split("\n", trim: true)
  end
end

defmodule Main do
  def run(file_path) do
    file_content =
      File.read!(file_path)
      |> Splitter.lines()

    total_sum =
      Enum.map(file_content, &Extractor.numbers/1)
      |> Enum.reduce(0, fn number, acc -> acc + String.to_integer(number) end)

    IO.inspect(total_sum)
  end
end

Main.run("./input.txt")
