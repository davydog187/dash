defmodule DashWeb.Dash do
  use Surface.LiveView

  alias DashWeb.Components.{Agenda, CodeNav, Notes, Stock, TickingClock}

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(:timer.seconds(1), :tick_clocks)
    end

    socket =
      assign(socket,
        clocks: ["America/New_York", "America/Montevideo", "America/Chicago"]
      )

    {:ok, socket}
  end

  def handle_info(:tick_clocks, socket) do
    for clock <- socket.assigns.clocks do
      TickingClock.tick(clock)
    end

    {:noreply, socket}
  end

  def render(assigns) do
    ~F"""
    <section class="p-8">
      <h1 class="text-6xl font-medium italic text-blue-400">Dash</h1>
      <div class="grid grid-cols-3 mt-4 gap-x-3 gap-y-16">
        {#for clock <- @clocks}
          <TickingClock id={clock} timezone={clock} />
        {/for}
        <Stock symbol="GME" price={100.0} pct_changed={0.1} />
        <Stock symbol="XOM" price={84.28} pct_changed={-0.82} />
        <Stock symbol="TSLA" price={420.0} pct_changed={0.34} />
      </div>

      <nav class="fixed right-10">
        <CodeNav id="nav" />
      </nav>
    </section>
    """
  end
end
