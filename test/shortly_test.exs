defmodule ShortlyTest do
  use ExUnit.Case
  doctest Shortly

  test "greets the world" do
    assert Shortly.hello() == :world
  end
end
