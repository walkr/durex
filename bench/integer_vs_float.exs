# USAGE: mix run ./this-file

Benchee.run(
  %{
    "parse duration with float  " => fn ->
      {:ok, 500} = Durex.ms("0.5s")
    end,
    "parse duration with integer" => fn ->
      {:ok, 1_000} = Durex.ms("1s")
    end
  },
  warmup: 0,
  time: 1,
  parallel: 1,
  print: %{configuration: false, fast_warning: false}
)
