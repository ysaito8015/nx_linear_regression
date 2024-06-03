# https://hexdocs.pm/scholar/linear_regression.html

defmodule LinearData do
  import Nx.Defn

  defn data do
    key = Nx.Random.key(42)
    size = 100
    {x, new_key} = Nx.Random.uniform(key, 0, 2, shape: {size, 1}, type: :f64)
    {noise, _} = Nx.Random.uniform(new_key, -0.5, 0.5, shape: {size, 1}, type: :f64)
    y = 3 * x + 4 + noise
    {x, y}
  end
end
