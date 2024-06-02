## NxLinearRegression

[How to solve a real machine learning problem with Nx -- DOCKYARD](https://dockyard.com/blog/2022/09/22/how-to-solve-a-real-machine-learning-problem-with-nx)

## Setup

```sh
$ mix deps.get
```


## Running the project

```sh
$ iex -S mix
```

```elixir
iex> data = NxLinearRegression.FuelEconomy.load_data()
iex> {train, test} = NxLinearRegression.train_test_split(data, 0.8)
iex> params = NxLinearRegression.FuelEconomy.train(train)
```
