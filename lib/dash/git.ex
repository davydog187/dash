defmodule Dash.Git do
  @moduledoc "A simple git client"

  @doc """
  Return the current git branch
  """
  def current_branch do
    case System.cmd("git", ["branch", "--show-current"]) do
      {branch, 0} -> String.trim(branch)
      _ -> "unknown"
    end
  end

  @doc """
  Switch to a git branch or tag

  #iex> switch("main")
  :ok
  """
  def switch(ref) do
    case System.cmd("git", ["checkout", ref, "-q"]) do
      {_, 0} -> :ok
      _ -> :error
    end
  end

  @doc """
  List all git tags

  #iex> tags()
  ["one", "two", "three"]
  """
  def tags do
    case System.cmd("git", ["tag"]) do
      {tags, 0} -> String.split(tags, "\n", trim: true)
      _ -> []
    end
  end

  @doc """
  Tags that point to the current commit

  #iex> current_tags()
  ["tag-one", "tag-two"]
  """
  def current_tags do
    case System.cmd("git", ["tag", "--points-at", "HEAD"]) do
      {tags, 0} -> String.split(tags, "\n", trim: true)
      _ -> []
    end
  end
end
