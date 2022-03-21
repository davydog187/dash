defmodule DashWeb.Components.Clock do
  use Surface.Component

  @moduledoc """
  A component that represents a wall-clock
  """

  @doc "The timestamp to display on the clock"
  prop time, :time, required: true

  @doc "The timestamp to display on the clock"
  prop format, :atom, values: [:standard, :military], default: :standard

  @doc "The timezone of the clock"
  prop timezone, :string, default: "America/New_York"

  data datetime, :datetime

  def render(assigns) do
    %{time: time, timezone: timezone} = assigns
    assigns = assign_new(assigns, :datetime, fn -> to_datetime(time, timezone) end)

    ~F"""
    {#case @format}
      {#match :standard}
        <div class="tabular-nums text-white">
          <span class="text-4xl font-bold">{Calendar.strftime(@datetime, "%I:%M")}</span>
          <span class="text-sm">{Calendar.strftime(@datetime, "%S")}</span>
          <span class="text-4xl font-bold">{Calendar.strftime(@datetime, "%p")}</span>
        </div>
      {#match :military}
        <span class="text-4xl text-white font-bold tabular-nums">
          {Calendar.strftime(@datetime, "%H:%M:%S")}
        </span>
    {/case}
    """
  end

  defp to_datetime(time, timezone) do
    datetime = DateTime.new!(Date.utc_today(), time)

    case DateTime.shift_zone(datetime, timezone) do
      {:ok, shifted} ->
        shifted

      {:error, _} ->
        datetime
    end
  end
end
