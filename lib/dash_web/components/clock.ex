defmodule DashWeb.Components.Clock do
  use Surface.Component

  @moduledoc """
  A component that represents a wall-clock
  """

  @doc "The timestamp to display on the clock"
  prop time, :time, required: true

  @doc "The timestamp to display on the clock"
  prop format, :atom, values: [:standard, :military], default: :standard

  prop timezone, :string, default: "America/New_York"

  def render(assigns) do
    ~F"""
    {#case @format}
      {#match :standard}
        <div class="tabular-nums">
          <span class="text-4xl font-bold">{format(@time, "%I:%M", @timezone)}</span>
          <span class="text-sm">{format(@time, "%S", @timezone)}</span>
          <span class="text-4xl font-bold">{format(@time, "%p", @timezone)}</span>
        </div>
      {#match :military}
        <span class="text-4xl font-bold tabular-nums">
          {format(@time, "%H:%M:%S", @timezone)}
        </span>
    {/case}
    """
  end

  defp format(time, pattern, timezone) do
    datetime = DateTime.new!(Date.utc_today(), time) |> DateTime.shift_zone!(timezone)

    Calendar.strftime(datetime, pattern)
  end
end
