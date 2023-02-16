defmodule MagentoApi do
  @server_url1 "http://127.0.0.1/Magento_242/pub/rest/all/V1/dzinehub/"
  @server_url2 "http://127.0.0.1/fko/rest/default/V1/producturlbysku/"
  @token "2b60546j631ctoqe86akgmepneo3kxum"
  @headers [Authorization: "Bearer #{@token}", Accept: "application/json"]

  def fetch_data(data) do
    (@server_url1 <> to_string(data))
    |> HTTPoison.post([])
    |> parse()
  end

  def fetch_sku(sku) do
    (@server_url2 <> to_string(sku))
    |> HTTPoison.get(@headers)
    |> parse()
  end

  def parse({:ok, %HTTPoison.Response{body: body, status_code: 200}}),
    do: body |> String.replace("\"", "")

  def parse(_res), do: :error
end
