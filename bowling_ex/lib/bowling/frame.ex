defmodule Bowling.Frame do
  @moduledoc """
  Struct to model a frame of a bowling game
  """

  defstruct rolls: [], score: 0

  @doc """
  Craft a new Frame struct

  ## Examples

      iex> Bowling.Frame.new
      %Bowling.Frame{rolls: [], score: 0}

  """
  def new(), do: %Bowling.Frame{}
end
