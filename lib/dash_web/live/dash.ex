defmodule DashWeb.Dash do
  use Surface.LiveView

  def render(assigns) do
    ~F"""
    <section class="p-8">
      <h1 class="text-4xl font-medium italic">Dash</h1>
    </section>
    """
  end
end
