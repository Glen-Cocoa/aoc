ExUnit.start()
Code.require_file("new.exs")

defmodule ThingTest do
  use ExUnit.Case

  test "creates a game record" do
    example = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    assert Thing.record(example) == %{game: 1, blue: 6, red: 4, green: 2}
  end
end
