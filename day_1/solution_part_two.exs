defmodule Extractor do

  @numbers %{"zero" => 0, "one" => 1, "two" => 2, "three" => 3, "four" => 4,
             "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}

  def get_numbers(input) do
    input
      |> clean_numbers()
      |> Enum.map(&parse_number/1)
      |> Enum.map(&break_numbers/1)
      |> List.flatten()
      |> Enum.map(&numberify/1)
      |> first_and_last()
  end

  defp numberify(char) when is_binary(char) do
    String.to_integer(char)
  end

  defp numberify(char) when is_integer(char), do: char

  defp break_numbers(num) when is_binary(num) do
    if String.length(num) > 1 do
      Integer.digits(String.to_integer(num))
    else
      num
    end
  end

  defp break_numbers(num), do: num

  defp clean_numbers(input) do
    Regex.scan(~r/(zero|one|two|three|four|five|six|seven|eight|nine|\d+)/, input)
    |> Enum.map(&hd/1)
  end

  defp parse_number(str) do
    case Map.get(@numbers, String.downcase(str)) do
      nil -> str
      value -> value
      end
    end

  defp first_and_last(numbers), do: "#{Enum.at(numbers, 0)}#{Enum.at(numbers, -1)}"
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
      Enum.map(file_content, &Extractor.get_numbers/1)
      |> Enum.reduce(0, fn number, acc -> acc + String.to_integer(number) end)

    IO.inspect(total_sum)
  end
end

Main.run("./input.txt")
