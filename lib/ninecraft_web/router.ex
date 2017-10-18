defmodule NinecraftWeb.Router do
  use NinecraftWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NinecraftWeb do
    pipe_through :browser # Use the default browser stack

    get "/hello", HelloController, :index
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", NinecraftWeb do
  #   pipe_through :api
  # end
end