defmodule AppStore.Mixfile do
  use Mix.Project

  def project do
    [
      app: :appstore,
      version: "0.1.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),

      name: "AppStore",
      description: "Itune App Store crawler and scraper",
      package: package()
    ]
  end

  defp package() do
    [
      files: ["lib", "README.md", "LICENSE", "mix.exs"],
      maintainers: ["Ícaro Ponce"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/icaroponce/appstore"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.1.0"},
      {:ex_doc, ">=0.0.0", only: :dev}
    ]
  end
end
