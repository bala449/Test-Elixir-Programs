defmodule NewXml do
  @moduledoc """
  Documentation for `NewXml`.
  """
  @doc """
  This is the main function. it's check file exist or not and convert the json format to map.
  """
  def file_read(filename \\ "testFile1.json") do
    with {:ok, body} <- File.read(filename), {:ok, json} <- Poison.decode(body)
      do
        separate_map = json["Envelope"]
                      |> Enum.map(fn x -> filter_data(x["Body"]["GetItemTransactionsResponse"]) end)
        final_map = %{"Body" => separate_map}
        file_write(final_map)
      else
        err -> err
    end
  end

  @doc """
  This function filter required data's only.
  """
  def filter_data(data) do
    item_id = data["Item"]["ItemID"]
    result = %{"#{item_id}" => %{"QuantityPurchased" => data["TransactionArray"]["Transaction"]["QuantityPurchased"],
            "ItemID" => data["Item"]["ItemID"],
            "UserID" => data["Item"]["Seller"]["UserID"],
            "Title" => data["Item"]["Title"],
            "CreatedDate" => data["TransactionArray"]["Transaction"]["CreatedDate"]}}
    result
  end

  @doc """
  It convert Map values to json format values.
  """
  def file_write(data) do
    with {:ok, json} <- Poison.encode(data), :ok <- File.write("outputFile1.json", json)
      do
        {:ok, "success"}
      else
        err -> err
    end
  end
end
