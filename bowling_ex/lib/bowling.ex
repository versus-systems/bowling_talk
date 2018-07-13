defmodule Bowling do
  @moduledoc """
  Score a game of bowling
  """

  @doc """
  Add a roll to a game of bowling

  ## Examples

      iex> Bowling.roll(%Bowling.Game{}, 1)
      %Bowling.Game{rolls: [1], frames: [%Bowling.Frame{rolls: [1], score: 0}], score: 0}

  """
  def roll(%Bowling.Game{} = game, pins) do
    rolls = append(game.rolls, pins)
    frames = frames(1, rolls)
    score = Enum.reduce(frames, 0, fn f, total -> total + f.score end)

    %Bowling.Game{rolls: rolls, frames: frames, score: score}
  end

  defp frames(10, [10, bonus1, bonus2]) do
    [%Bowling.Frame{rolls: [10], score: 10 + bonus1 + bonus2}]
  end

  defp frames(count, [10, bonus1, bonus2 | tail]) do
    [
      %Bowling.Frame{rolls: [10], score: 10 + bonus1 + bonus2}
      | frames(count + 1, [bonus1, bonus2 | tail])
    ]
  end

  defp frames(count, [10, bonus]) do
    [
      %Bowling.Frame{rolls: [10], score: 0}
      | frames(count + 1, [bonus])
    ]
  end

  defp frames(count, [roll1, roll2, bonus | tail]) when roll1 + roll2 == 10 do
    [
      %Bowling.Frame{rolls: [roll1, roll2], score: roll1 + roll2 + bonus}
      | frames(count + 1, [bonus | tail])
    ]
  end

  defp frames(count, [roll1, roll2 | tail]) when count < 11 and roll1 + roll2 < 10 do
    [
      %Bowling.Frame{rolls: [roll1, roll2], score: roll1 + roll2}
      | frames(count + 1, tail)
    ]
  end

  defp frames(count, [roll1, roll2]) when count < 11,
    do: [%Bowling.Frame{rolls: [roll1, roll2], score: 0}]

  defp frames(count, [roll]) when count < 11, do: [%Bowling.Frame{rolls: [roll], score: 0}]

  defp frames(_, _), do: []

  defp append(list, value) do
    list
    |> Enum.reverse()
    |> prepend(value)
    |> Enum.reverse()
  end

  defp prepend(list, value), do: [value | list]
end
