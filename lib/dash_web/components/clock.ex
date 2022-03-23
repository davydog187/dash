defmodule DashWeb.Components.Clock do
  use Surface.Component

  @moduledoc """
  A component that represents a wall-clock
  """

  @doc "The timestamp to display on the clock"
  prop time, :time, required: true

  def render(assigns) do
    ~F"""
    <span class="text-4xl text-white font-bold tabular-nums">
      {Calendar.strftime(@time, "%H:%M:%S")}
    </span>
    """
  end
end
