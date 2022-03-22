defmodule DashWeb.Components.Clock do
  use Surface.Component

  @moduledoc """
  A component that represents a wall-clock
  """

  @doc "The timestamp to display on the clock"
  prop time, :time, required: true

  @doc "The timestamp to display on the clock"
  prop format, :atom, values: [:standard, :military], default: :standard

  def render(assigns) do
    ~F"""
    {#case @format}
      {#match :standard}
        <div class="tabular-nums text-white">
          <span class="text-4xl font-bold">{Calendar.strftime(@time, "%I:%M")}</span>
          <span class="text-sm">{Calendar.strftime(@time, "%S")}</span>
          <span class="text-4xl font-bold">{Calendar.strftime(@time, "%p")}</span>
        </div>
      {#match :military}
        <span class="text-4xl text-white font-bold tabular-nums">
          {Calendar.strftime(@time, "%H:%M:%S")}
        </span>
    {/case}
    """
  end
end
