defmodule DashWeb.Components.Stock.Playground do
  @moduledoc """
  Play around with a Stock component
  """
  use Surface.Catalogue.Playground,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.Stock,
    height: "250px",
    title: "Stock Playground"

  data props, :map,
    default: %{
      symbol: "TSLA",
      price: 900.00,
      pct_changed: 0.5
    }

  def render(assigns) do
    ~F"""
    <Stock {...@props} />
    """
  end
end
