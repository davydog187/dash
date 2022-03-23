defmodule DashWeb.Components.Clock.Military do
  @moduledoc """
  Example using Clocks using standard time
  """

  use Surface.Catalogue.Example,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.Clock,
    height: "400px",
    title: "Military, 24 hour time",
    container: {:div, class: "flex flex-col gap-3"}

  alias DashWeb.Components.Clock

  def render(assigns) do
    ~F"""
    <Clock format={:military} time={~T[06:00:00]} />
    <Clock format={:military} time={~T[12:00:00]} />
    <Clock format={:military} time={~T[18:00:00]} />
    """
  end
end
