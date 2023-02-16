defmodule MyException do
  defexception message: "Operation resulted in error!"
end
defmodule TestMyException do
  def execute_something() do
    try do
      execute()
    rescue
      error in MyException ->
      IO.puts(error.message)
    end
  end
  defp execute(), do: raise MyException
end
defmodule CatchCode do
  def execute_something(value) do
    try do
      execute(value)
    catch
      :exit, code -> "Exiting with code #{code}"
      :throw, data -> "Caught the thrown #{inspect(data)}"
      caught, what -> "Caught #{caught}, #{what}"
    end
  end
  # Function that send a value through exit
  defp execute(:exit) do
    exit(:not_working_anymore)
  end
  # Function that throws a value
  defp execute(:throw) do
    throw({:some, :data})
  end
  # Function that raises an erlang error
  defp execute(:erlerr) do
    :erlang.error("Error from erlang")
  end
end
