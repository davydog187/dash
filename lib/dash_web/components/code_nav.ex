defmodule DashWeb.Components.CodeNav do
  use Surface.LiveComponent

  @moduledoc """
  Navigate between different git tags

  For demonstrating the progression of code changes during the presentation.
  """

  alias Surface.Components.Form
  alias Surface.Components.Form.Select

  data tags, :list

  def mount(socket) do
    selected =
      case Dash.Git.current_tags() do
        [tag | _rest] -> tag
        _ -> nil
      end

    {:ok, assign(socket, tags: Dash.Git.tags(), selected: selected)}
  end

  def handle_event("tag-selected", %{"nav" => %{"tag" => tag}}, socket) do
    :ok = Dash.Git.switch(tag)

    {:noreply, assign(socket, :selected, tag)}
  end

  def render(assigns) do
    ~F"""
    <Form for={:nav} change="tag-selected">
      <Select
        class="rounded border-blue-400 bg-gray-700 text-blue-400 focus:ring-blue-600"
        field="tag"
        {=@selected}
        options={@tags}
      />
    </Form>
    """
  end
end
