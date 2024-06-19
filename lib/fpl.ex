defmodule FPL do
  import Nx.Defn

  defnp loss_fn({a, b, c, d}, x, y) do
    y_pred = log4pl(x, a, b, c, d)
    Nx.mean(Nx.pow(y_pred - y, 2))
  end

  defnp log4pl(x, a, b, c, d) do
    ((a - d) / (1.0 + Nx.pow(x / c, b)) + d)
  end

  defn update({a, b, c, d} = params, x, y, lr) do
    {grad_a, grad_b, grad_c, grad_d} = grad(params, &loss_fn(&1, x, y))
    {a - grad_a * lr,  b - grad_b * lr, c - grad_c * lr * 1000, d - grad_d * lr}
  end
end
