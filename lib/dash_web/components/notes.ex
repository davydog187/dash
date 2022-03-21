defmodule DashWeb.Components.Notes do
  use Surface.MacroComponent

  alias Surface.MacroComponent
  alias Surface.IOHelper
  alias Surface.AST

  slot default

  def expand(attributes, content, meta) do
    ast = %AST.Literal{value: "test"}

    quote_surface do
      ~F[^ast]
    end
  end
end
