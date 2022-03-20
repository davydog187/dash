defmodule DashWeb.Components.Agenda do
  use Surface.Component

  @doc """
  List of agenda items of the form `%{name: String.t(), time: Time.t()}`
  """
  prop items, :list, default: []

  @doc """
  Limit of agenda items to show
  """
  prop limit, :integer

  def render(assigns) do
    ~F"""
    <ul class="space-y-2">
      {#for item <- limit(@items, @limit)}
        <li>
          <span class="inline-block w-12 italic">{format_time(item.time)}</span>
          <span class="text-xl text-white text-bold">{item.name}</span>
        </li>
      {#else}
        <h3 class="text-2xl text-white text-extrabold">Nothing to do today</h3>
      {/for}
    </ul>
    """
  end

  # TODO show an infinite list of things in the agenda and show the memory debugging tools

  def format_time(time) do
    Calendar.strftime(time, "%H:%M")
  end

  defp limit(items, nil), do: items
  defp limit(items, limit), do: Enum.take(items, limit)
end
