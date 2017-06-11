defmodule AppStore.App do
  @base_url "https://itunes.apple.com/lookup"

  def get_details(bundleId, country \\ "us") do
    url = "#{@base_url}?bundleId=#{bundleId}&country=#{country}"  
    app = Task.async(fn -> AppStore.Common.request(url) end)
    Task.await app
  end
end
