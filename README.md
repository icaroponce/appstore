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

app["sellerName"] 
#"King.com Limitied"
```

## Contributing

This module is quite new, and there's a lot to be improved and implemented. 
I intend to put here on docs a complete todo list soon, but meanwhile I don't do this, check out the [`app-store-scraper`](https://github.com/facundoolano/app-store-scraper) to have a good reference and idea of what the module should offer. 

Feel free to fork it, enhance and send a PR.
