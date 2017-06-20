defmodule AppStore.Search do
  import AppStore.Common

  @base_url "https://itunes.apple.com/search"

  def by_keyword(term, device \\ "software", num \\ 50, country \\ 'us') do
    if !term do
      raise "A term must be provided"
    end

    url = "#{@base_url}?media=software&entity=#{device}&term=#{term}&limit=#{num}&country=#{country}"
    search = Task.async(fn -> request(url) end)    
    search_list = Task.await search, 10000
    case search_list do
      {:ok, data} -> {:ok, data |> Enum.map(&clean_app/1) }
      {:error, msg} -> {:error, msg}
      :error -> :error
    end
  end
end
