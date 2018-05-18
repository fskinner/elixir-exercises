defmodule ElixirExercises.GuessGame do
  def start do
    guess(random(), 1)
  end

  @doc """
  """
  def guess(generated, guesses) do
    try do
      input =
        IO.gets("Your guess: ")
        |> String.trim()
        |> String.to_integer()
        |> compare_guess(generated)

      case input do
        :greater ->
          IO.puts("My number is greater.")
          guess(generated, guesses + 1)

        :lower ->
          IO.puts("My number is lower...")
          guess(generated, guesses + 1)

        :equal ->
          IO.puts("You won with #{guesses} guesses!")
      end
    rescue
      x in [RuntimeError] ->
        IO.puts(x.message)
        guess(generated, guesses)
    end
  end

  @doc """
    ## Examples
    iex> GuessGame.compare_guess(2, 9)
    :greater
    iex> GuessGame.compare_guess(3, 1)
    :lower
    iex> GuessGame.compare_guess(1, 1)
    :equal
  """
  def compare_guess(input, generated) when generated > input do
    :greater
  end

  def compare_guess(input, generated) when generated < input do
    :lower
  end

  def compare_guess(_, _) do
    :equal
  end

  defp random do
    round(:rand.uniform() * 100)
  end
end
