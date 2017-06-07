defmodule AppStore.App do
  @base_url "https://itunes.apple.com/lookup"

  defp parser_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    data = body |> Poison.decode! 
    try do
      results = data["results"]
      {:ok, results}
    rescue 
      _ -> :error
    end
  end

  defp parser_response(_), do: :error

  defp request_app(url) do
    result = url |> HTTPoison.get |> parser_response 
    case result do 
      {:ok, app} -> {:ok, app}
      :error -> :error
    end
  end

  def get_details(bundleId, country \\ "us") do
    url = "#{@base_url}?bundleId=#{bundleId}&country=#{country}"  
    app = Task.async(fn -> request_app(url) end)
    Task.await app
  end

end
