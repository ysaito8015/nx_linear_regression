defmodule Log4Pl do
  alias NimbleCSV.RFC4180, as: CSV

  def load_data do
    "./data/ELISA.csv"
    |> File.read!()
    |> CSV.parse_string()
    |> Enum.map(fn values ->
      Enum.map(values, fn value ->
        value
        |> String.trim()
        |> Float.parse()
        |> elem(0)
      end)
    end)
  end

  def absorbance do
    data = Log4Pl.load_data()

    a = Nx.tensor(data)
    a = Nx.transpose(a)
    a = a[0..1]

    background_avg = Nx.divide(Nx.add(a[0][7], a[1][7]), 2)

    a = Nx.subtract(a, background_avg)

    a = a[[.., 0..-2//1]]
    Nx.flatten(a)
  end

  def concentration do
    c =
      for n <- 0..6 do
        1000 * :math.pow(0.5, n)
      end

    Nx.tensor(c ++ c)
  end

  def loss_fn({a, b, c, d}, x, y) do
    y_pred = log4pl(x, a, b, c, d)
    Nx.mean(Nx.pow(y_pred - y, 2))
  end

  defp log4pl(x, a, b, c, d) do
    ((a - d) / (1.0 + Nx.pow(x / c, b)) + d)
  end

  def get_model do
    data = Stream.zip(concentration(), absorbance())

    model = Axon.input("input", shape: {nil, 32}) |> Axon.dense(1, activation: :sigmoid)

    model
    |> Axon.Loop.trainer(&loss_fn/3, Polaris.Optimizers.rmsprop(learning_rate: 0.01))
    |> Axon.Loop.run(data)
  end
end
