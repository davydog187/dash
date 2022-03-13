defmodule DashWeb.Components.TickingClock.Playground do
  use Surface.Catalogue.Playground,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.TickingClock,
    height: "250px"

  data props, :map, default: %{}

  def handle_event("tick", _, socket) do
    TickingClock.tick("clock")

    {:noreply, socket}
  end

  def render(assigns) do
    ~F"""
    <TickingClock id="clock" {...@props} />

    <div class="my-4">
        <button class="text-white border border-white rounded p-2 hover:text-red-500 hover:bg-gray-600" :on-click="tick">Tick</button>
    </div>
    """
  end
end
