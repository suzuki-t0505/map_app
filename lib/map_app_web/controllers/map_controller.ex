defmodule MapAppWeb.MapController do
  use MapAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
