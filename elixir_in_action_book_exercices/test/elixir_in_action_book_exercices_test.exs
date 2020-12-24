defmodule ElixirInActionBookExercicesTest do
  use ExUnit.Case
  doctest ElixirInActionBookExercices

  test "greets the world" do
    assert ElixirInActionBookExercices.hello() == :world
  end
end
