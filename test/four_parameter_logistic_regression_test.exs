defmodule FourParameterLogisticRegressionTest do
  use ExUnit.Case

  test "Scholar.Linear.LinearRegression.fit/2" do
    data = NxLinearRegression.FuelEconomy.load_data()
    {x, y} = Enum.unzip(data)

    x = Enum.map(x, fn e -> [e] end)
    x = Nx.tensor(x)
    y = Nx.tensor(y)

    model = FourParameterLogisticRegression.fit(x, y)

    dbg model
  end
end
