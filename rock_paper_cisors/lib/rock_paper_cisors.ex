defmodule RockPaperCisors do
  def hello do
    :world
  end

  def create_initial_game_state() do
    %{}
  end

  def register(game_state, player) do
    case game_state do
      %{^player => _} -> {:error, "The state already has an object like this one"}
      _ ->{:ok, (
        Map.put(game_state, player, {:player, 0})
      )}
    end
  end

  def differently_create_initial_game_state() do
    %{:players => %{}}
  end

  def differently_register(game_state, player) do
    game_state = case game_state do
      %{:players => %{
        ^player => _
      }} -> {:error, "The state already has a player like this one"}
      %{:players => players } -> {:ok, Map.put(game_state, :players, Map.put(players, player, 0))}
    end
  end
end
