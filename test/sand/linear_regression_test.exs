defmodule Sand.LinearRegressionTest do
  use ExUnit.Case

  describe "Sand.LinearRegression" do
    test "original" do
      sample = [
        [166, 58.7],
        [176.0, 75.7],
        [171.0, 62.1],
        [173.0, 70.4],
        [169.0, 60.1]
      ]

      sample = Nx.tensor(sample, names: [:x, :y])
      x = sample[y: 0]
      y = sample[y: 1]

      x = Nx.subtract(x, Nx.mean(x))
      y = Nx.subtract(y, Nx.mean(y))

      epochs = 500
      lr = 0.0001
      init_params = Sand.LinearRegression.init_params()

      acc =
        for _ <- 1..epochs, reduce: init_params do
          acc -> Sand.LinearRegression.update(acc, x, y, lr)
        end

      dbg acc
    end

    test "fuel economy" do
      data = NxLinearRegression.FuelEconomy.load_data()

      {x, y} = Enum.unzip(data)

      x = Nx.tensor(x)
      y = Nx.tensor(y)

      x = Nx.subtract(x, Nx.mean(x))
      y = Nx.subtract(y, Nx.mean(y))

      epochs = 500
      lr = 0.0001
      init_params = Sand.LinearRegression.init_params()

      acc =
        for _ <- 1..epochs, reduce: init_params do
          acc -> Sand.LinearRegression.update(acc, x, y, lr)
        end

      dbg acc
    end
  end
end
