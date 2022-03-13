defmodule DashWeb.Catalogue do
  use Surface.Catalogue

  def body do
    [class: "bg-gray-700 text-gray-300 p-8"]
  end

  @impl true
  def config() do
    [
      head_css: """
      <link phx-track-static rel="stylesheet" href="/assets/app.css" />
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
      </style>
      """,
      head_js: """
      <script defer phx-track-static type="text/javascript" src="/assets/app.js"></script>
      """,
      example: [body: body()],
      playground: [body: body()]
    ]
  end
end
