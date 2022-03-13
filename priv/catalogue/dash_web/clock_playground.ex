defmodule DashWeb.Components.Clock.Playground do
  use Surface.Catalogue.Playground,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.Clock,
    height: "250px"

  data props, :map,
    default: %{
      time: ~T[12:00:00],
      format: :standard
    }

  def render(assigns) do
    ~F"""
    <Clock {...@props} />
    """
  end
end
