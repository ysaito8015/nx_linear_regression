defmodule Sand.LinearRegression do
  import Nx.Defn

  defn pred({w, b}, x) do
    w * x + b
  end

  defn mse(yp, y) do
    (yp - y)
    |> Nx.pow(2)
    |> Nx.mean()
  end

  defn loss(params, x, y) do
    yp = pred(params, x)
    mse(yp, y)
  end

  defn update({w, b} = params, x, y, lr) do
    {grad_w, grad_b} = grad(params, &loss(&1, x, y))
    { w - grad_w * lr,  b - grad_b * lr }
  end

  defn init_params do
    {Nx.tensor(1.0), Nx.tensor(1.0)}
  end
end
