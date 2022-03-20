defmodule DashWeb.Components.TickingClock do
  use Surface.LiveComponent

  alias DashWeb.Components.Clock

  prop timezone, :string, required: true

  data time, :time, default: ~T[00:00:00]

  def render(assigns) do
    ~F"""
    <div class="flex flex-col">
      <Clock format={:standard} {=@time} {=@timezone} />
      <div class="text-xl">{format_timezone(@timezone)}</div>
    </div>
    """
  end

  def tick(id) do
    send_update(__MODULE__, id: id, time: Time.utc_now())
  end

  defp format_timezone(nil), do: ""

  defp format_timezone(string) do
    string |> String.split("/") |> Enum.at(1) |> String.replace("_", " ")
  end
end
