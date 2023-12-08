
defmodule Splitter do
  def split(file_content) do
    file_content
      |> String.split("\n")
      |> Enum.map(&parse/1)
  end

  def parse(game_string) do
    IO.inspect(game_string)
    # game_number = Regex.run(~r/Game (\d+):/, game_string)|> IO.inspect()
  end
end

# defmodule Processor do
#   def work(_x) do
#     2
#   end
# end

defmodule Main do
  @constraint %{red: 12, green: 13, blue: 14}

  def run(file_path) do
    file_content =
      File.read!(file_path)
      |> Splitter.split()
      |> Splitter.parse()

    # total_sum =
    #   Enum.map(file_content, &Processor.work/1)
    #   |> Enum.reduce(0, fn number, acc -> acc + String.to_integer(number) end)

    # IO.inspect(total_sum)
  end
end

Main.run("./sample.txt")
