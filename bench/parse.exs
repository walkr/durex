# USAGE: mix run ./this-file

Benchee.run(
  %{
    "parse duration with float  " => fn ->
      {:ok, 500} = Durex.parse("0.5s")
    end,
    "parse duration with integer" => fn ->
      {:ok, 1_000} = Durex.parse("1s")
    end
  },
  warmup: 0,
  time: 1,
  parallel: 1,
  formatter_options: %{console: %{extended_statistics: false}},
  print: %{configuration: false, fast_warning: false}
)