defmodule Timemanagerbackend.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add(:name, :string)
      add(:description, :string)

      timestamps()
    end

    create(unique_index(:teams, [:name]))
  end
end
