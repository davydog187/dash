defmodule DashWeb.Dash do
  use Surface.LiveView

  alias DashWeb.Components.{Agenda, CodeNav, Notes, Stock, Clock}

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <section class="p-8">
      <h1 class="text-6xl font-medium italic text-blue-400">Dash</h1>
      <div class="grid grid-cols-3 mt-4 gap-x-3 gap-y-16">
      </div>

      <nav class="fixed right-10">
        <CodeNav id="nav" />
      </nav>
    </section>
    """
  end
end
