defmodule DashWeb.Components.Stock.PriceDown do
  @moduledoc """
  Example of a stock price that is up today
  """
  use Surface.Catalogue.Example,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.Stock,
    height: "250px",
    title: "Price Down"

  def render(assigns) do
    ~F"""
    <Stock symbol="XOM" price={82.28} pct_changed={-0.8} />
    """
  end
end
