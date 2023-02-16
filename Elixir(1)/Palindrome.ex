defmodule Palindrome do
  def palindrome do
    input = IO.gets("Enter the Number : ") |> String.trim_trailing
    if(is_palindrome?(input)) do
      IO.puts("Yes! #{input} is a Palindrome")
      acknowledgement()
    else
      IO.puts("No! #{input} is not a Palindrome")
      acknowledgement()
    end
  end
  def is_palindrome?(input) do
    String.reverse(input) == input
  end
  def acknowledgement do
    acknowledge = IO.gets("Would you want to check with another number(yes/no) : ") |> String.trim_trailing
    case acknowledge do
      "yes" -> palindrome()
      "no" -> IO.puts("Thanks!")
      _ ->
        IO.puts("Please Enter valid Input \n")
        acknowledgement()
    end
  end
end
