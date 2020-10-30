defmodule Timemanagerbackend.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :label, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:roles, [:user_id])
  end
end
