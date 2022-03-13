defmodule DashWeb.Components.Clock.Standard do
  @moduledoc """
  Example using Clocks using standard time
  """

  use Surface.Catalogue.Example,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.Clock,
    height: "400px",
    title: "Standard, 12 hour time"

  alias DashWeb.Components.Clock

  def render(assigns) do
    ~F"""
    <Clock format={:standard} time={~T[06:00:00]} />
    <Clock format={:standard} time={~T[12:00:00]} />
    <Clock format={:standard} time={~T[18:00:00]} />
    """
  end
end
