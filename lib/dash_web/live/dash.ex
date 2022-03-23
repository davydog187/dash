defmodule DashWeb.Dash do
  use Surface.LiveView

  alias DashWeb.Components.{Agenda, CodeNav, Notes, Stock, Clock}

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        items: fetch_agenda()
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <section class="p-8">
      <h1 class="text-6xl font-medium italic text-blue-400">Dash</h1>
      <div class="grid grid-cols-3 mt-4 gap-x-3 gap-y-16">
        <Clock format={:standard} time={Time.utc_now()} />
      </div>

      <nav class="fixed right-10">
        <CodeNav id="nav" />
      </nav>
    </section>
    """
  end

  defp fetch_agenda do
    [
      %{name: "Wake up", time: ~T[06:00:00]},
      %{name: "Go to Big Elixir", time: ~T[09:00:00]},
      %{name: "Hurricanes with Chris Bell", time: ~T[17:00:00]},
      %{name: "Jazz show", time: ~T[21:00:00]},
      %{name: "Find some shrimp etoufee", time: ~T[23:00:00]}
    ]
  end
end
