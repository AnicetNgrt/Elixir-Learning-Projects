defmodule TodoList.CsvImporter do
  @doc """
  Imports a todo list from a CSV file in which each
  entry is like "YYYY/MM/DD,title"
  """
  @spec import_from(String.t()) :: TodoList.t()
  def import_from(path) do
    File.stream!(path)
    |> Stream.map(&parse_line/1)
    |> IO.inspect()
    |> TodoList.new()
  end

  defp parse_line(line) do
    [date_str, title_str] = String.split(line, ",")
    date_parts_str = String.split(date_str, "/")
    title_str = String.replace(title_str, "\n", "")
    compose_entry(date_parts_str, title_str)
  end

  defp compose_entry([year, month, date], title) do
    %{date: compose_date(year, month, date), title: title}
  end

  defp compose_date(year, month, date) do
    [year, month, date] = Enum.map([year, month, date], &String.to_integer/1)
    {:ok, date} = Date.new(year, month, date)
    date
  end
end
