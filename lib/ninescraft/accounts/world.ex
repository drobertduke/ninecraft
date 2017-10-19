defmodule Ninescraft.Accounts.World do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ninescraft.Accounts.World


  schema "worlds" do
    field :history, :string
    field :name, :string
    field :state, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%World{} = world, attrs) do
    world
    |> cast(attrs, [:name, :state, :history, :user_id])
    |> validate_required([:name, :state, :history, :user_id])
  end
end
