defmodule Timemanagerbackend.Repo.Migrations.UserBelongsToTeam do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:team_id, references(:teams))
    end
  end

  # create(index(:users, [:team_id]))
end
