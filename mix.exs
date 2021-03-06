defmodule Gc.Mixfile do
  use Mix.Project

  def project do
    [app: :gc,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:cowboy, :plug, :logger, :ecto, :postgrex],
      mod: {Gc, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:plug, "~> 1.1"},
      {:cowboy, "~> 1.0.0"},
      {:guardian, "~> 0.12.0"},
      {:postgrex, "~> 0.11"},
      {:ecto, "~> 2.0.0"},
      {:poison, "~> 2.2.0"},
      {:comeonin, "~> 2.3"}
    ]
  end
end
