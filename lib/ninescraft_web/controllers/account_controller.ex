defmodule NinescraftWeb.AccountController do
  use NinescraftWeb, :controller

  def index(conn, _params) do
    render conn, "index.json", accounts: []
  end
end
