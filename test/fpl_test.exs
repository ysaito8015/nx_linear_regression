defmodule FPLTest do
  use ExUnit.Case

  test "Four parameter logistic curve" do
    x = Nx.tensor([1.95, 3.91, 7.381, 15.63, 31.25, 62.5, 125.0, 250.0, 500.0, 1000.0])
    x = Nx.divide(x, 1000)
    y = Nx.tensor([0.274, 0.347, 0.392, 0.420, 0.586, 1.115, 1.637, 2.227, 2.335, 2.372])

    epochs = 2500
    lr = 0.05

    {a, b, c, d} = {Nx.tensor(1.0), Nx.tensor(1.0), Nx.tensor(1.0), Nx.tensor(1.0)}

    acc =
      Enum.reduce(1..epochs, {a, b, c, d}, fn _epoch, acc ->
        FPL.update(acc, x, y, lr)
      end)

    {a, b, c, d} = acc
    a = Nx.to_number(a)
    b = Nx.to_number(b)
    c = Nx.to_number(c)
    d = Nx.to_number(d)

    dbg {a, b, c, d}
  end
end
