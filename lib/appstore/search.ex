defmodule AppStore.Search do
  @base_url "https://itunes.apple.com/search"

  def by_keyword(term, entity \\ "software", num \\ 50) do
    if !term do
      raise "A term must be provided"
    end

    url = "#{@base_url}?media=software&entity=#{entity}&term=#{term}&limit=#{num}"
    search = Task.async(fn -> AppStore.Common.request(url) end)    
    Task.await(search)
  end
end
