defmodule NxLinearRegression.MixProject do
  use Mix.Project

  def project do
    [
      app: :nx_linear_regression,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:nx, "~> 0.7.2"},
      {:axon, "~> 0.6.1"},
      {:nimble_csv, "~> 1.1"},
      {:scholar, "~> 0.3.0"},
      {:explorer, "~> 0.8.2"},
      {:exla, "~> 0.7.2"},
      {:kino_vega_lite, "~> 0.1.11"},
      {:kino, "~> 0.12.3"},
      {:kino_explorer, "~> 0.1.19"},
      {:tucan, "~> 0.3.1"}
    ]
  end
end
