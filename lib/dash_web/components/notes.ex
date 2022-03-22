defmodule DashWeb.Components.Notes do
  use Surface.MacroComponent

  @moduledoc """
  A (simple) Markdown component
  """

  alias Surface.AST
  alias Dash.Markdown, as: DashMark

  @doc "Notes in (simple) markdown format. Supports <sarcasm /> and unordered lists."
  slot default

  def expand(_attributes, content, _meta) do
    %AST.Literal{value: "<div>" <> DashMark.to_html(content) <> "</div>"}
  end
end
