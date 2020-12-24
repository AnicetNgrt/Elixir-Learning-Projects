defmodule ElixirInActionBookExercices do
  @moduledoc """
  Documentation for ElixirInActionBookExercices.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirInActionBookExercices.hello()
      :world

  """
  def hello do
    :world
  end

  def list_len_v1(list) do length(list) end

  def list_len_v2(list) do
    Enum.reduce(list, fn (_element, acc) -> acc + 1 end)
  end

  def list_len_v3(list) do
    Enum.reduce(list, fn (_, acc) -> acc + 1 end)
  end

  def list_len_v4(list) do
    Enum.reduce(list, fn (_, acc) -> Kernel.+(acc, 1) end)
  end

  def list_len_rec_v1(list) do
    case list do
      [] -> 0
      [_|tail] -> 1 + list_len_rec_v1(tail)
    end
  end

  def list_len_rec_v2([]) do 0 end
  def list_len_rec_v2([_|tail]) do 1 + list_len_rec_v2(tail) end

  def list_len_rec_tail_call_v1(list) do list_len_rec_tail_call_v1(list, 0) end
  defp list_len_rec_tail_call_v1([], acc) do acc end
  defp list_len_rec_tail_call_v1([_|tail], acc) do list_len_rec_tail_call_v1(tail, acc + 1) end

  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&String.length(&1))
    |> Enum.each(&IO.puts/1)
  end

  def longest_line_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.length/1)
    |> Enum.sort(&(&1 > &2))
    |> List.first()
  end

  def lines_word_counts!(path) do
    File.stream!(path)
    |> Stream.map(&length(String.split(&1, " ")))
    |> Enum.each(&IO.puts/1)
  end
end
