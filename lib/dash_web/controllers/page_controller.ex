defmodule DashWeb.PageController do
  use DashWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
