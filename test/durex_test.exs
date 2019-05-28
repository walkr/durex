defmodule DurexTest do
  use ExUnit.Case

  doctest Durex

  test "ms! success" do
    assert Durex.ms!("1ms") == 1
  end

  test "ms! failure" do
    assert_raise(ArgumentError, fn ->
      Durex.ms!("bla")
    end)
  end

  test "deprecated functions" do
    assert Durex.parse!("1ms") == 1
    assert Durex.parse("1ms") == {:ok, 1}
  end
end
