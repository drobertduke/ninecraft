defmodule Ninescraft.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Ninescraft.Repo

  alias Ninescraft.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Ninescraft.Accounts.World

  @doc """
  Returns the list of worlds.

  ## Examples

      iex> list_worlds()
      [%World{}, ...]

  """
  def list_worlds(user) do
    World
    |> where([t], t.user_id == ^user.id)
    |> Repo.all
  end

  @doc """
  Gets a single world.

  Raises `Ecto.NoResultsError` if the World does not exist.

  ## Examples

      iex> get_world!(123)
      %World{}

      iex> get_world!(456)
      ** (Ecto.NoResultsError)

  """
  def get_world!(user, id) do
    World
    |> where([t], t.user_id == ^user.id)
    |> Repo.get!(id)
  end

  @doc """
  Creates a world.

  ## Examples

      iex> create_world(%{field: value})
      {:ok, %World{}}

      iex> create_world(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_world(attrs \\ %{}) do
    %World{}
    |> World.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a world.

  ## Examples

      iex> update_world(world, %{field: new_value})
      {:ok, %World{}}

      iex> update_world(world, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_world(%World{} = world, attrs) do
    world
    |> World.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a World.

  ## Examples

      iex> delete_world(world)
      {:ok, %World{}}

      iex> delete_world(world)
      {:error, %Ecto.Changeset{}}

  """
  def delete_world(%World{} = world) do
    Repo.delete(world)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking world changes.

  ## Examples

      iex> change_world(world)
      %Ecto.Changeset{source: %World{}}

  """
  def change_world(%World{} = world) do
    World.changeset(world, %{})
  end
end
