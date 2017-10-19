defmodule NinescraftWeb.Router do
  use NinescraftWeb, :router

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

  scope "/", NinescraftWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", NinescraftWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit] do
      resources "/worlds", WorldController, except: [:new, :edit]
    end
  end

end
