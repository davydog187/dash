defmodule DashWeb.Dash do
  use Surface.LiveView

  alias DashWeb.Components.{TickingClock}

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(:timer.seconds(1), :tick_clock)
    end

    socket = assign(socket, clock: "clock")

    {:ok, socket}
  end

  def handle_info(:tick_clock, socket) do
    TickingClock.tick(socket.assigns.clock)

    {:noreply, socket}
  end

  def render(assigns) do
    ~F"""
    <section class="p-8">
      <h1 class="text-4xl font-medium italic">Dash</h1>
      <div class="grid grid-cols-6">
        <TickingClock id={@clock} />
      </div>
    </section>
    """
  end
end
