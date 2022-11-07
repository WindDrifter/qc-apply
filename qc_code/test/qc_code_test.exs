defmodule QcCodeTest do
  use ExUnit.Case
  doctest QcCode
  describe "count_letter_frequency" do
    test "count letter frequency correctly" do
      assert QcCode.count_letter_frequency("aaaabbbcc") === "a4b3c2"
    end

    test "count letter frequency correctly even with same letter on end" do
      assert QcCode.count_letter_frequency("aaaabbbccaaaa") === "a4b3c2a4"
    end

    test "count letter frequency correctly and ignore number" do
      assert QcCode.count_letter_frequency("aaaa123bbbcc") === "a4b3c2"
    end

    test "count letter frequency correctly and ignore number at beginning and end" do
      assert QcCode.count_letter_frequency("123aaaa123bbbcc123") === "a4b3c2"
    end

    test "ignore symbol and letter" do
      assert QcCode.count_letter_frequency("!!!&3aaaa123bbbcc123") === "a4b3c2"
    end

  end

end
