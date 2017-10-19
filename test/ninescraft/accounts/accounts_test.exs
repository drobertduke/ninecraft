defmodule Ninescraft.AccountsTest do
  use Ninescraft.DataCase

  alias Ninescraft.Accounts

  describe "users" do
    alias Ninescraft.Accounts.User

    @valid_attrs %{username: "some username"}
    @update_attrs %{username: "some updated username"}
    @invalid_attrs %{username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "worlds" do
    alias Ninescraft.Accounts.World

    @valid_attrs %{history: "some history", name: "some name", state: "some state"}
    @update_attrs %{history: "some updated history", name: "some updated name", state: "some updated state"}
    @invalid_attrs %{history: nil, name: nil, state: nil}

    def world_fixture(attrs \\ %{}) do
      {:ok, world} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_world()

      world
    end

    test "list_worlds/0 returns all worlds" do
      world = world_fixture()
      assert Accounts.list_worlds() == [world]
    end

    test "get_world!/1 returns the world with given id" do
      world = world_fixture()
      assert Accounts.get_world!(world.id) == world
    end

    test "create_world/1 with valid data creates a world" do
      assert {:ok, %World{} = world} = Accounts.create_world(@valid_attrs)
      assert world.history == "some history"
      assert world.name == "some name"
      assert world.state == "some state"
    end

    test "create_world/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_world(@invalid_attrs)
    end

    test "update_world/2 with valid data updates the world" do
      world = world_fixture()
      assert {:ok, world} = Accounts.update_world(world, @update_attrs)
      assert %World{} = world
      assert world.history == "some updated history"
      assert world.name == "some updated name"
      assert world.state == "some updated state"
    end

    test "update_world/2 with invalid data returns error changeset" do
      world = world_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_world(world, @invalid_attrs)
      assert world == Accounts.get_world!(world.id)
    end

    test "delete_world/1 deletes the world" do
      world = world_fixture()
      assert {:ok, %World{}} = Accounts.delete_world(world)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_world!(world.id) end
    end

    test "change_world/1 returns a world changeset" do
      world = world_fixture()
      assert %Ecto.Changeset{} = Accounts.change_world(world)
    end
  end
end
