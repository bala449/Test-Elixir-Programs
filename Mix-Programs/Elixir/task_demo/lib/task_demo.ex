defmodule TaskDemo do
  @moduledoc """
  Documentation for `TaskDemo`.
  """

  @server_url "http://numbersapi.com/"

  @doc """
  First this function concat input number to server url
  Next getting response from the server and filter data

  ## Examples

      iex> TaskDemo.fetch_fact 11
      iex> 1..25 |> Enum.map(&TaskDemo.fetch_fact/1)
  """

  def fetch_fact(number) do
    response =
      (@server_url <> to_string(number))
      |> HTTPoison.get()
      |> parse_response

    case response do
      {:ok, body} -> body
      _ -> {:error, "#{number} - Some error"}
    end
  end

  def parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    {:ok, body}
  end

  def parse_response(_res), do: :error

  def find_facts_tasks(numbers) do
    results =
      numbers
      |> Enum.map(&Task.async(fn -> TaskDemo.fetch_fact(&1) end))
      |> Enum.map(&Task.await/1)

    IO.puts("#{inspect(results)}")
  end
end
