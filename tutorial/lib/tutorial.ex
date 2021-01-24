defmodule Tutorial do
  def create_zoo do
    ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]
  end

  def randomize(zoo) do
    Enum.shuffle(zoo)
  end

  def contains?(zoo, animal) do
    Enum.member?(zoo, animal)
  end

  def see_animals(zoo, count) do
    {_seen, to_see} = Enum.split(zoo, -count)
    to_see
  end

  @doc """
  selection takes a number, creates a zoo, randomises it and then returns a list
  of animals of length selected

  ## Examples

      iex> Tutorial.selection(2)
      ["gorilla", "giraffe"]

  """
  def selection(number_of_animals) do
    Tutorial.create_zoo()
    |> Tutorial.randomize()
    |> Tutorial.see_animals(number_of_animals)
  end

  def save(zoo, filename) do
    binary = :erlang.term_to_binary(zoo)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
  end

  def dict_tests() do
    animal = %{
      name: "Rex",
      type: "dog",
      legs: 4
    }

    IO.puts animal.name
    updatedAnimal = Map.put(animal, :name, "Max")
    %{animal | name: "Max"}
  end
end
