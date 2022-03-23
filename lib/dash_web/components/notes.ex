defmodule DashWeb.Components.Notes do
  use Surface.Component

  @moduledoc """
  A (simple) Markdown component
  """

  alias Surface.AST
  alias Dash.Markdown, as: DashMark

  @doc "Notes in (simple) markdown format"
  slot default

  def render(assigns) do
    ~F"""
    <div><#slot /></div>
    """
  end
end
