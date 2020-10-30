defmodule Timemanagerbackend.Repo.Migrations.UserBelongsToRoles do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:roles_id, references(:roles))
    end
  end
end
