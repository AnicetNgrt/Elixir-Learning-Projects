defmodule TutorialTest do
  use ExUnit.Case
  # doctest Tutorial

  test "randomise" do
    zoo = Tutorial.create_zoo
    refute zoo == Tutorial.randomize(zoo)
  end
end
