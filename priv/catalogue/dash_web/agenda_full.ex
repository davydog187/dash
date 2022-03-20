defmodule DashWeb.Components.Agenda.Full do
  @moduledoc """
  Example of too many Agenda items
  """

  use Surface.Catalogue.Example,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.Agenda,
    height: "400px",
    title: "Way too busy to show 'em all"

  data items, :list,
    default: [
      %{name: "Wake up", time: ~T[06:00:00]},
      %{name: "Go to Big Elixir", time: ~T[09:00:00]},
      %{name: "Hurricanes with Chris Bell", time: ~T[17:00:00]},
      %{name: "Jazz show", time: ~T[21:00:00]},
      %{name: "Find some shrimp etoufee", time: ~T[23:00:00]},
      %{name: "Oh boy, poboy time", time: ~T[23:05:00]},
      %{name: "Midnight Muffaletta", time: ~T[23:59:00]}
    ]

  def render(assigns) do
    ~F"""
    <Agenda {=@items} limit={5} />
    """
  end
end
