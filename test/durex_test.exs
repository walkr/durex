defmodule DurexTest do
  use ExUnit.Case
  doctest Durex

  test "ms! parse integers" do
    for {string, expected} <- [
          {"10ms", 10},
          {"1s", 1_000},
          {"1m", 60_000},
          {"1h", 60_000 * 60},
          {"1d", 60_000 * 60 * 24},
          {"1w", 60_000 * 60 * 24 * 7}
        ] do
      assert Durex.ms!(string) == expected
    end
  end

  test "ms! parse float" do
    for {string, expected} <- [
          {"0.5s", 1_000 / 2},
          {"0.5m", 60_000 / 2},
          {"0.5h", 60_000 * 60 / 2},
          {"0.5d", 60_000 * 60 * 24 / 2},
          {"0.5w", 60_000 * 60 * 24 * 7 / 2}
        ] do
      assert Durex.ms!(string) == expected
    end
  end

  test "ms! failure" do
    assert_raise(ArgumentError, fn ->
      Durex.ms!("bla")
    end)
  end
end
