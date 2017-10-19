defmodule NinescraftWeb.WorldControllerTest do
  use NinescraftWeb.ConnCase

  alias Ninescraft.Accounts
  alias Ninescraft.Accounts.World

  @create_attrs %{history: "some history", name: "some name", state: "some state"}
  @update_attrs %{history: "some updated history", name: "some updated name", state: "some updated state"}
  @invalid_attrs %{history: nil, name: nil, state: nil}

  def fixture(:world) do
    {:ok, world} = Accounts.create_world(@create_attrs)
    world
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all worlds", %{conn: conn} do
      conn = get conn, world_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create world" do
    test "renders world when data is valid", %{conn: conn} do
      conn = post conn, world_path(conn, :create), world: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, world_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "history" => "some history",
        "name" => "some name",
        "state" => "some state"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, world_path(conn, :create), world: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update world" do
    setup [:create_world]

    test "renders world when data is valid", %{conn: conn, world: %World{id: id} = world} do
      conn = put conn, world_path(conn, :update, world), world: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, world_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "history" => "some updated history",
        "name" => "some updated name",
        "state" => "some updated state"}
    end

    test "renders errors when data is invalid", %{conn: conn, world: world} do
      conn = put conn, world_path(conn, :update, world), world: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete world" do
    setup [:create_world]

    test "deletes chosen world", %{conn: conn, world: world} do
      conn = delete conn, world_path(conn, :delete, world)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, world_path(conn, :show, world)
      end
    end
  end

  defp create_world(_) do
    world = fixture(:world)
    {:ok, world: world}
  end
end
