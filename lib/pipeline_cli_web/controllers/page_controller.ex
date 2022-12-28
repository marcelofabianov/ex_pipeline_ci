defmodule PipelineCliWeb.PageController do
  use PipelineCliWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
