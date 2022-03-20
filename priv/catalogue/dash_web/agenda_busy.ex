defmodule DashWeb.Components.Agenda.Busy do
  @moduledoc """
  Example of several Agenda items
  """

  use Surface.Catalogue.Example,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.Agenda,
    height: "400px",
    title: "Got some things to do"

  data items, :list,
    default: [
      %{name: "Wake up", time: ~T[06:00:00]},
      %{name: "Go to The Big Elixir", time: ~T[09:00:00]},
      %{name: "Hurricanes with Chris Bell", time: ~T[17:00:00]}
    ]

  def render(assigns) do
    ~F"""
    <Agenda {=@items} />
    """
  end
end
