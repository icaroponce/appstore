# Appstore

Elixir module to scrape data from Itunes App Store.
Gradually porting it from [`app-store-scraper`](https://github.com/facundoolano/app-store-scraper) NodeJS module. 

## Installation

First, add `appstore` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:appstore, "~> 0.1.0"}]
end
```
and run `$ mix deps.get`

## Usage

Available modules:

### App

Handles API calls directly related to an application.

#### get_details

Retrieves the full detail of an application. Options:

- `bundleId`: the Itunes bundleId. This parameter must be provided. 
- `country`: the two letter country code to get the app from. Defaults to `us`.

Example: 

```elixir
{:ok, app} = AppStore.App.get_details "com.midasplayer.apps.candycrushsaga"

app[0]["sellerName"] 
#"King.com Limitied"
```

### Search

Allow users to search throughout App Store.

#### by_keyword

Retrieves a list of apps searched by a given term. 

Method Signature: `by_keyword(term, device, num, country)`
Options:

- `term`: a term to search for. Required.
- `device`: a device to filter for. Defaults to `software`, which brings all devices. Other options are `iPadSoftware` and `macSoftware`.
- `num`: the quantity of apps to be retrieved. Defaults to `50`. Max should be `250`, there's no validation so far, though. (`TODO`).
- `country`: the two letter country code to get the list from. Defaults to `us`.  

Example: 

```elixir
{:ok, apps} = AppStore.Search.by_keyword("deutschland", "software", 20, "de")

apps
#[ {...}, {...} ]  a list of apps. 
```

## Contributing

This module is quite new, and there's a lot to be improved and implemented. 
I intend to put here on docs a complete todo list soon, but meanwhile I don't do this, check out the [`app-store-scraper`](https://github.com/facundoolano/app-store-scraper) to have a good reference and idea of what the module should offer. 

Feel free to fork it, enhance and send a PR.
