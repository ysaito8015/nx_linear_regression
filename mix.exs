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
      {:nimble_csv, "~> 1.1"},
      {:scholar, "~> 0.3.0"},
    ]
  end
end
