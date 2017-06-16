defmodule AppStore.Struct.App do
  @moduledoc false

  defstruct \
    trackId: nil, \
    bundleId: nil, \
    title: nil, \
    url: nil, \
    description: nil, \
    icon: nil, \
    genres: nil, \
    genreIds: nil, \
    primaryGenre: nil, \
    primaryGenreId: nil, \
    contentRating: nil, \
    languages: nil, \
    size: nil, \
    requiredOsVersion: nil, \
    released: nil, \
    updated: nil, \
    releaseNotes: nil, \
    version: nil, \
    price: nil, \
    currency: nil, \
    free: nil, \
    developerId: nil, \
    developer: nil, \
    developerUrl: nil, \
    developerWebsite: nil, \
    score: nil, \
    reviews: nil, \
    currentVersionScore: nil, \
    currentVersionReviews: nil, \
    screenshots: nil, \
    ipadScreenshots: nil, \
    appletvScreenshots: nil, \
    supportedDevices: nil 
end
