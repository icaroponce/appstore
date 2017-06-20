defmodule AppStore.App do
  import AppStore.Common

  @base_url "https://itunes.apple.com/lookup"

  def get_details(bundleId, country \\ "us") do
    url = "#{@base_url}?bundleId=#{bundleId}&country=#{country}"  
    app = Task.async(fn -> request(url) end)
    fetched_app = Task.await app, 10000
    case fetched_app do
      {:ok, data} -> {:ok, clean_app(List.first(data))}
      {:error, msg} -> {:error, msg}
      :error -> :error
    end
  end
end
