defmodule Log4PlTest do
  use ExUnit.Case

  test "Four parameter logistic curve" do
    dbg Log4Pl.absorbance

    dbg Log4Pl.concentration

    dbg Log4Pl.get_model
  end
end
