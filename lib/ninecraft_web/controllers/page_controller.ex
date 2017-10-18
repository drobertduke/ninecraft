defmodule NinecraftWeb.PageController do
  use NinecraftWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
