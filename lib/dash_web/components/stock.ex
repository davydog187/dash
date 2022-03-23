defmodule DashWeb.Components.Stock do
  use Surface.Component

  @moduledoc """
  A component for showing a stock, price, and daily change
  """

  @doc "The stock symbol, e.g. GME"
  prop symbol, :string, required: true

  @doc "The current price of this stock"
  prop price, :number, required: true

  @doc "The percent this stock has changed today"
  prop pct_changed, :number, required: true

  def render(assigns) do
    ~F"""
    <div class="flex flex-col tabular-nums">
      <div class="text-4xl text-bold text-white">{@symbol}</div>
      <div>
        <span>{@price}</span>
        <span class="text-gray-600">|</span>
        <span>{format_pct(@pct_changed)}</span>
      </div>
    </div>
    """
  end

  defp format_pct(float) do
    float = Float.round(float * 100, 2)

    if float >= 0.0 do
      "+#{float} %"
    else
      "#{float} %"
    end
  end
end
