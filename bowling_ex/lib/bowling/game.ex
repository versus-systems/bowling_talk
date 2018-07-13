defmodule Bowling.Game do
  @moduledoc """
  Struct to model a game of bowling
  """

  defstruct rolls: [], frames: [], score: 0

  @doc """
  Craft a new Game struct

  ## Examples

      iex> Bowling.Game.new
      %Bowling.Game{rolls: [], frames: [], score: 0}

  """
  def new(), do: %Bowling.Game{}
end
