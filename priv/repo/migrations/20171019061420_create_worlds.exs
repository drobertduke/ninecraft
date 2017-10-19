defmodule Ninescraft.Repo.Migrations.CreateWorlds do
  use Ecto.Migration

  def change do
    create table(:worlds) do
      add :name, :string
      add :state, :string
      add :history, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:worlds, [:user_id])
  end
end
