defmodule DashWeb.Components.TickingClock do
  use Surface.LiveComponent

  alias DashWeb.Components.Clock

  data time, :time, default: ~T[00:00:00]

  def render(assigns) do
    ~F"""
    <Clock format={:standard} {=@time} />
    """
  end

  def tick(id) do
    send_update(__MODULE__, id: id, time: Time.utc_now())
  end
end
