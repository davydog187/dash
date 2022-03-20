defmodule DashWeb.Components.Agenda.None do
  @moduledoc """
  Example of no Agenda items
  """

  use Surface.Catalogue.Example,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.Agenda,
    height: "400px",
    title: "Nothing to do today"

  def render(assigns) do
    ~F"""
    <Agenda />
    """
  end
end
