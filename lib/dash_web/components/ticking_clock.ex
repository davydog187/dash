defmodule DashWeb.Components.TickingClock do
  use Surface.LiveComponent

  @moduledoc """
  A stateful clock that can receive tick updates
  """

  alias DashWeb.Components.Clock

  @doc "The timezone of the clock"
  prop timezone, :string, required: true

  @doc "datetime"
  data datetime, :datetime

  def render(assigns) do
    assigns = assign_new(assigns, :datetime, fn -> DateTime.utc_now() end)

    ~F"""
    <div class="flex flex-col">
      <Clock format={:standard} time={shift_time(@datetime, @timezone)} />
      <div class="text-xl">{format_timezone(@timezone)}</div>
    </div>
    """
  end

  @doc """
  Send a tick to the clock to update to the latest time.
  """
  def tick(id) do
    send_update(__MODULE__, id: id, datetime: DateTime.utc_now())
  end

  defp format_timezone(nil), do: ""

  defp format_timezone(string) do
    string |> String.split("/") |> Enum.at(1) |> String.replace("_", " ")
  end

  defp shift_time(datetime, timezone) do
    case DateTime.shift_zone(datetime, timezone) do
      {:ok, shifted} ->
        DateTime.to_time(shifted)

      {:error, _} ->
        DateTime.to_time(datetime)
    end
  end
end
