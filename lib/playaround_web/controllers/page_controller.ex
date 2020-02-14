defmodule PlayaroundWeb.PageController do
  use PlayaroundWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
