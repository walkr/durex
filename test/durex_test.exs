defmodule DurexTest do
  use ExUnit.Case
  doctest Durex

  test "parse! success" do
    assert Durex.parse!("1ms") == 1
  end

  test "parse! failure" do
    assert_raise(ArgumentError, fn ->
      Durex.parse!("bla")
    end)
  end
end
