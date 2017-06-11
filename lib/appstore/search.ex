defmodule AppStore.Search do
  @base_url "https://itunes.apple.com/search"

  def by_keyword(term, device \\ "software", num \\ 50, country \\ 'us') do
    if !term do
      raise "A term must be provided"
    end

    url = "#{@base_url}?media=software&entity=#{device}&term=#{term}&limit=#{num}&country=#{country}"
    search = Task.async(fn -> AppStore.Common.request(url) end)    
    Task.await(search)
  end
end
