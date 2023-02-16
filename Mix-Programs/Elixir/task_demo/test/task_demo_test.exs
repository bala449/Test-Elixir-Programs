defmodule TaskDemoTest do
  use ExUnit.Case
  doctest TaskDemo

  test "Server response success or faild" do
    assert is_bitstring(TaskDemo.fetch_fact(12))
  end
end
