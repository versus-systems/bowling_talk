defmodule BowlingTest do
  use ExUnit.Case
  doctest Bowling

  describe "Bowling.roll/2" do
    test "a roll of 1 has a score of 0" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(1)

      assert game.rolls == [1]
      assert length(game.frames) == 1
      assert game.score == 0
    end

    test "rolls of 1 and 1 have a score of 2" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(1)
        |> Bowling.roll(1)

      assert game.rolls == [1, 1]
      assert length(game.frames) == 1
      assert game.score == 2
    end

    test "rolls of 1, 1, and 1 have a score of 2" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)

      assert game.rolls == [1, 1, 1]
      assert length(game.frames) == 2
      assert game.score == 2
    end

    test "rolling 1, 20 times, has a score of 20" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)
        |> Bowling.roll(1)

      assert game.rolls == [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
      assert length(game.frames) == 10
      assert game.score == 20
    end

    test "rolls of 1, 9, and 1 have a score of 11" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(1)
        |> Bowling.roll(9)
        |> Bowling.roll(1)

      assert game.rolls == [1, 9, 1]
      assert length(game.frames) == 2
      assert game.score == 11
    end

    test "rolls of 1, 9, 1, and 1 have a score of 13" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(1)
        |> Bowling.roll(9)
        |> Bowling.roll(1)
        |> Bowling.roll(1)

      assert game.rolls == [1, 9, 1, 1]
      assert length(game.frames) == 2
      assert game.score == 13
    end

    test "rolls of 10, 1, and 1 have a score of 14" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(1)
        |> Bowling.roll(1)

      assert game.rolls == [10, 1, 1]
      assert length(game.frames) == 2
      assert game.score == 14
    end

    test "rolls of 10, 1, and 9 have a score of 20" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(1)
        |> Bowling.roll(9)

      assert game.rolls == [10, 1, 9]
      assert length(game.frames) == 2
      assert game.score == 20
    end

    test "rolls of 10, 1, 9, and 1 have a score of 31" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(1)
        |> Bowling.roll(9)
        |> Bowling.roll(1)

      assert game.rolls == [10, 1, 9, 1]
      assert length(game.frames) == 3
      assert game.score == 31
    end

    test "rolls of 10, 1, 9, 1, and 1 have a score of 33" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(1)
        |> Bowling.roll(9)
        |> Bowling.roll(1)
        |> Bowling.roll(1)

      assert game.rolls == [10, 1, 9, 1, 1]
      assert length(game.frames) == 3
      assert game.score == 33
    end

    test "rolls of 10, 10, and 10 have a score of 30" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)

      assert game.rolls == [10, 10, 10]
      assert length(game.frames) == 3
      assert game.score == 30
    end

    test "rolls of 10, 10, and 1 have a score of 21" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(1)

      assert game.rolls == [10, 10, 1]
      assert length(game.frames) == 3
      assert game.score == 21
    end

    test "rolls of 10, 10, 1, and 1 have a score of 35" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(1)
        |> Bowling.roll(1)

      assert game.rolls == [10, 10, 1, 1]
      assert length(game.frames) == 3
      assert game.score == 35
    end

    test "rolls of 10, 10, 1, and 9 have a score of 41" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(1)
        |> Bowling.roll(9)

      assert game.rolls == [10, 10, 1, 9]
      assert length(game.frames) == 3
      assert game.score == 41
    end

    test "a perfect game of 12 strikes, has a score of 300" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)

      assert game.rolls == [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      assert length(game.frames) == 10
      assert game.score == 300
    end

    test "an almost perfect game of 10 strikes, then 9, 1 has a score of 289" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(9)
        |> Bowling.roll(1)

      assert game.rolls == [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 1]
      assert length(game.frames) == 10
      assert game.score == 289
    end

    test "an almost perfect game of 10 strikes, then 9, 0 has a score of 288" do
      game =
        %Bowling.Game{}
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(10)
        |> Bowling.roll(9)
        |> Bowling.roll(0)

      assert game.rolls == [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 0]
      assert length(game.frames) == 10
      assert game.score == 288
    end
  end
end
