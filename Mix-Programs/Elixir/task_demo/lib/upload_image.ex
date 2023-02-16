defmodule UploadImage do
  @api_endpoint "https://api.ebay.com/ws/api.dll"
  @headers [
    {"X-EBAY-API-SITEID", 3},
    {"X-EBAY-API-COMPATIBILITY-LEVEL", 967},
    {"X-EBAY-API-CALL-NAME", "UploadSiteHostedPictures"}
  ]
  @body """
    <UploadSiteHostedPicturesRequest xmlns="urn:ebay:apis:eBLBaseComponents">
      <RequesterCredentials>
        <eBayAuthToken>v^1.1#i^1#I^3#f^0#p^3#r^1#t^Ul4xMF8xMDo4MkRBMTNENDRCQzNGMUQwQTU3NEVERDE0Q0NGNTIzMl8zXzEjRV4yNjA=</eBayAuthToken>
      </RequesterCredentials>
      <ErrorLanguage>en_US</ErrorLanguage>
      <WarningLevel>High</WarningLevel>
      <ExternalPictureURL>https://www.dzine-hub.co.uk/image2.jpg</ExternalPictureURL>
      <PictureName>Developer Page Banner</PictureName>
    </UploadSiteHostedPicturesRequest>
  """

  def fetch_img_url do
    @api_endpoint
    |> HTTPoison.post(@body, @headers)
    |> parse()
  end

  defp parse({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body
    |> XmlJson.Parker.deserialize()
    |> get_img_url()
  end

  defp get_img_url({:ok, %{"SiteHostedPictureDetails" => %{"FullURL" => full_url}}}) do
    full_url
  end
end
