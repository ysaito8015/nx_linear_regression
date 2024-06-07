defmodule Log4PlTest do
  use ExUnit.Case

  test "Four parameter logistic curve" do
    x = Log4Pl.absorbance
    y = Log4Pl.concentration
    epochs = 500
    lr = 0.0001
    init_params = Log4Pl.init_params()

    acc =
      for _ <- 1..epochs, reduce: init_params do
        acc -> Log4Pl.update(acc, x, y, lr)
      end

    dbg acc
  end
end
