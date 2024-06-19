defmodule Log4PlTest do
  use ExUnit.Case

  test "Four parameter logistic curve (1)" do
    x = Log4Pl.absorbance
    y = Log4Pl.concentration
    epochs = 2500
    lr = 0.02

    {a, b, c, d} = Log4Pl.init_params()

    acc =
      Enum.reduce(1..epochs, {[], a, b, c, d}, fn _epoch, acc ->
        Log4Pl.update(acc, x, y, lr)
      end)

    dbg x
    dbg y

    {_, a, b, c, d} = acc
    dbg Nx.to_number(a)
    dbg Nx.to_number(b)
    dbg Nx.to_number(c)
    dbg Nx.to_number(d)
  end

  test "Four parameter logistic curve (2)" do
    x = Nx.tensor([1.95, 3.91, 7.381, 15.63, 31.25, 62.5, 125.0, 250.0, 500.0, 1000.0])
    y = Nx.tensor([0.274, 0.347, 0.392, 0.420, 0.586, 1.115, 1.637, 2.227, 2.335, 2.372])

    epochs = 2500
    lr = 0.05

    {a, b, c, d} = Log4Pl.init_params()

    acc =
      Enum.reduce(1..epochs, {a, b, c, d}, fn _epoch, acc ->
        Log4Pl.update(acc, x, y, lr)
      end)

    {a, b, c, d} = acc
    dbg Nx.to_number(a)
    dbg Nx.to_number(b)
    dbg Nx.to_number(c)
    dbg Nx.to_number(d)
  end
end
