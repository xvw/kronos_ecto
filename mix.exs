defmodule Kronos.Ecto.Mixfile do
  use Mix.Project


  defp description do 
    """
    Provide Custom Types for Kronos.t (simple timestamps).
    """
  end

  def project do
    [
      app: :kronos_ecto,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      source_url: "https://github.com/xvw/kronos_ecto",
      homepage_url: "https://github.com/xvw/kronos_ecto",
      deps: deps(),
      package: package(),
      description: description(),
      docs: docs()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :ecto]]
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
      {:kronos, "~> 1.0.0"},
      {:ecto, "~> 2.1.0"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  def docs do 
    [
      main: "readme",
      extras: [
        "README.md"
      ]
    ]
  end

  defp package do
    [
     name: :kronos_ecto,
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Xavier Van de Woestyne"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/xvw/kronos_ecto",
              "Docs" => "http://xvw.github.io/kronos_ecto/doc/readme.html"}]
  end
end
