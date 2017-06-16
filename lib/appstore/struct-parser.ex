defmodule AppStore.Struct_parser do
  @moduledoc false

  def to_struct(kind, attrs) do
     struct = struct(kind)
     Enum.reduce Map.to_list(struct), struct, fn {k, _}, acc ->
       case Map.fetch(attrs, k) do
         {:ok, v} -> %{acc | k => v}
         :error -> acc
       end
     end
  end

  def clean_app(app) do
    mapped_app = %{
      trackId: app["trackId"],
      bundleId: app["bundleId"],
      title: app["trackName"],
      url: app["trackViewUrl"],
      description: app["description"],
      icon: app["artworkUrl512"] || app["artworkUrl100"] || app["artworkUrl60"],
      genres: app["genres"],
      genreIds: app["genreIds"],
      primaryGenre: app["primaryGenreName"],
      primaryGenreId: app["primaryGenreId"],
      contentRating: app["contentAdvisoryRating"],
      languages: app["languageCodesISO2A"],
      size: app["fileSizeBytes"],
      requiredOsVersion: app["minimumOsVersion"],
      released: app["releaseDate"],
      updated: app["currentVersionReleaseDate"] || app["releaseDate"],
      releaseNotes: app["releaseNotes"],
      version: app["version"],
      price: app["price"],
      currency: app["currency"],
      free: app["price"] == 0,
      developerId: app["artistId"],
      developer: app["artistName"],
      developerUrl: app["artistViewUrl"],
      developerWebsite: app["sellerUrl"],
      score: app["averageUserRating"],
      reviews: app["userRatingCount"],
      currentVersionScore: app["averageUserRatingForCurrentVersion"],
      currentVersionReviews: app["userRatingCountForCurrentVersion"],
      screenshots: app["screenshotUrls"],
      ipadScreenshots: app["ipadScreenshotUrls"],
      appletvScreenshots: app["appletvScreenshotUrls"],
      supportedDevices: app["supportedDevices"]
    }
    to_struct(AppStore.Struct.App, mapped_app)
  end
end
