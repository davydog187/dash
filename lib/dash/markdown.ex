defmodule Dash.Markdown do
  @moduledoc """
  A light version of Markdown

  Supports
  * <sarcasm />
  * unordered list, e.g. "* ..."
  """
  def to_html(markdown) do
    markdown
    |> replace_sarcasm()
    |> convert_to_list()
  end

  defp replace_sarcasm(content) do
    Regex.replace(
      ~r[<sarcasm>(.*)</sarcasm>],
      content,
      fn _, text ->
        spongebob = Dash.Spongebob.speak(text)
        "<span class=\"italic text-blue-200\">#{spongebob}</span>"
      end
    )
  end

  defp convert_to_list(content) do
    content
    |> String.split(~r/\n\s*/, trim: true)
    |> process()
    |> Enum.join("\n")
  end

  defp process([]), do: []

  defp process(["* " <> _ | _rest] = list) do
    ["<ul class=\"list-disc\">" | process_list(list)]
  end

  defp process([line | rest]), do: [line | process(rest)]

  defp process_list(["* " <> line | rest]) do
    ["<li>" <> line <> "</li>" | process_list(rest)]
  end

  defp process_list(list) do
    ["</ul>" | process(list)]
  end
end
