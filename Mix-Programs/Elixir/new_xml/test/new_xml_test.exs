defmodule NewXmlTest do
  use ExUnit.Case
  doctest NewXml

  test "read file" do
    assert NewXml.file_read("test.txt") == {:error, :enoent}
  end
end
