defmodule DashWeb.Components.Stock.PriceUp do
  @moduledoc """
  Example of a stock price that is up today
  """
  use Surface.Catalogue.Example,
    catalogue: DashWeb.Catalogue,
    subject: DashWeb.Components.Stock,
    height: "250px",
    title: "Price Up"

  def render(assigns) do
    ~F"""
    <Stock symbol="GME" price={100.00} pct_changed={0.05} />
    """
  end
end
