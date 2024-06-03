defmodule LineardDataTest do
  use ExUnit.Case

  test "Linear regression in practice" do
    {x, _y} = LinearData.data()
    dbg x
    # dbg y
  end
end
