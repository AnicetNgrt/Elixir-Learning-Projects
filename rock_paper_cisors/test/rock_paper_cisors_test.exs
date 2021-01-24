defmodule RockPaperCisorsTest do
  use ExUnit.Case
  doctest RockPaperCisors

  test "greets the world" do
    assert RockPaperCisors.hello() == :world
  end

  test "can create initial game state and it's empty" do
    assert RockPaperCisors.create_initial_game_state() == %{}
  end

  test "can register a player and gives it 0 points" do
    game_state = RockPaperCisors.create_initial_game_state()
    {:ok, game_state} = RockPaperCisors.register(game_state, :Anicet)
    assert (case game_state do
      %{:Anicet => {:player, 0}} -> true
      _ -> false
    end)
  end

  test "can register 2 players and give them both 0 points" do
    game_state = RockPaperCisors.create_initial_game_state()
    {:ok, game_state} = RockPaperCisors.register(game_state, :Anicet)
    {:ok, game_state} = RockPaperCisors.register(game_state, :Jean)
    assert (case game_state do
      %{
        :Anicet => {:player, 0},
        :Jean => {:player, 0}
      } -> true
      _ -> false
    end)
  end

  test "differently can create initial game state and it's empty" do
    assert RockPaperCisors.differently_create_initial_game_state() == %{:players => %{}}
  end

  test "differently can register 2 players and give them both 0 points" do
    game_state = RockPaperCisors.differently_create_initial_game_state()
    {:ok, game_state} = RockPaperCisors.differently_register(game_state, :Anicet)
    {:ok, game_state} = RockPaperCisors.differently_register(game_state, :Jean)
    assert (case game_state do
      %{:players => %{
        :Anicet => 0,
        :Jean => 0
      }} -> true
      _ -> false
    end)
  end
end
