defmodule NinescraftWeb.WorldController do
  use NinescraftWeb, :controller

  alias Ninescraft.Accounts
  alias Ninescraft.Accounts.World

  action_fallback NinescraftWeb.FallbackController

  def index(conn, _params, user) do
    worlds = Accounts.list_worlds(user)
    render(conn, "index.json", worlds: worlds, user: user)
  end

  def create(conn, %{"world" => world_params}, user) do
    world_params = world_params
      |> Map.put("user_id", user.id)

    with {:ok, %World{} = world} <- Accounts.create_world(world_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_world_path(conn, :show, user, world))
      |> render("show.json", world: world, user: user)
    end
  end

  def show(conn, %{"id" => id}, user) do
    world = Accounts.get_world!(user, id)
    render(conn, "show.json", world: world, user: user)
  end

  def update(conn, %{"id" => id, "world" => world_params}, user) do
    world = Accounts.get_world!(user, id)

    with {:ok, %World{} = world} <- Accounts.update_world(world, world_params) do
      render(conn, "show.json", world: world, user: user)
    end
  end

  def delete(conn, %{"id" => id}, user) do
    world = Accounts.get_world!(user, id)
    with {:ok, %World{}} <- Accounts.delete_world(world) do
      send_resp(conn, :no_content, "")
    end
  end

  def action(conn, _) do
    user = Accounts.get_user!(conn.params["user_id"])
    args = [conn, conn.params, user]
    apply(__MODULE__, action_name(conn), args)
  end

end
