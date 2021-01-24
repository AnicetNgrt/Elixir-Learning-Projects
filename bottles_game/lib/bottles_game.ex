defmodule BottlesGame do

  defmodule State do
    defstruct players: [],
              turn: 0,
              bottles: nil,
              loser: nil
  end

  def init(players_path, count) do
    {:ok, players} = build_player_list(players_path)
    IO.puts "Let's start with #{count} bottles."
    IO.puts "Players are:\n#{inspect players}"
    {:ok, %BottlesGame.State{
      players: players,
      bottles: count
    }}
  end

  def play(%BottlesGame.State{bottles: bottles, turn: turn, players: players} = state, count)
  when count > 0 and bottles - count > 0
  do
    {:ok, player} = get_turn_player(players, turn)
    IO.puts "#{player} is getting rid of #{count} bottles. #{bottles-count} left"
    {:ok, %{state | bottles: bottles - count, turn: turn + 1}}
  end

  def play(%BottlesGame.State{bottles: bottles, turn: turn, players: players} = state, count)
  when count > 0 and bottles - count == 0
  do
    {:ok, loser} = get_turn_player(players, turn)
    IO.puts "#{loser} is getting rid of #{count} bottles. #{bottles-count} left"
    IO.puts "#{loser} has lost."
    {:ok, %{state | bottles: bottles - count, turn: turn + 1, loser: loser}}
  end

  def play(%BottlesGame.State{} = state, count) when count > 0 do
    IO.puts "not enough bottles left"
    {:ok, state}
  end

  def play(%BottlesGame.State{} = state, _) do
    IO.puts "negative numbers bad"
    {:ok, state}
  end

  defp get_turn_player([_|_] = players, turn) when turn >= 0 do
    case Enum.at(players, rem(turn, length(players)), -1) do
      -1 -> :error
      res -> {:ok, res}
    end
  end

  defp build_player_list(players_path) do
    try do
      players = File.stream!(players_path)
      |> Stream.map(&(String.replace(&1, "\n", "")))
      |> Enum.map(&(:"#{&1}"))
      {:ok, players}
    catch
      error -> {:error, error}
    end
  end
end
