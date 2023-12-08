defmodule Thing do
  # @constraint %{blue: 14, green: 13, red: 12}
  def execute do
    # list of lines
    lines = File.read!("./input.txt")
    |> String.split("\n")
    |> Enum.map(&record/1)
    |> Enum.map(&get_power/1)
    # |> Enum.filter(&(&1.blue <= 14))
    # |> Enum.filter(&(&1.green <= 13))
    # |> Enum.filter(&(&1.red <= 12))
    # |> Enum.map(&(&1.game))
    |> Enum.reduce(0, fn num, acc ->
      num + acc end)

    IO.inspect(lines)
  end

  def get_power(%{game: _game, green: green, red: red, blue: blue}) do
  green*red*blue
  end
    # fn to take one line and return game record
    def record(line) do
      [_original, game_number] = Regex.run(~r/Game (\d+)/, line)
      blue_number = get_max("blue", line)
      red_number = get_max("red", line)
      green_number = get_max("green", line)

      %{
        game: String.to_integer(game_number),
        blue: String.to_integer(blue_number),
        red: String.to_integer(red_number),
        green: String.to_integer(green_number)
      }
    end

    defp get_max(color, line) do
      Regex.scan(~r/(\d+) #{color}/, line)
        |> Enum.reduce(nil, fn curr_list, acc ->
          [_first, value] = curr_list
          if acc == nil or String.to_integer(value) > String.to_integer(acc) do
            value
          else
            acc
          end
        end)
    end
  end

Thing.execute()

# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
# %{Game: 1, blue: 6, red: 4, green: 2}
# {1, 6, 4, 2}
