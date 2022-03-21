defmodule DashWeb.Components.Notes do
  use Surface.MacroComponent

  alias Surface.AST
  alias Dash.Markdown, as: DashMark

  slot default

  def expand(_attributes, content, _meta) do
    %AST.Literal{value: DashMark.to_html(content)}
  end
end
