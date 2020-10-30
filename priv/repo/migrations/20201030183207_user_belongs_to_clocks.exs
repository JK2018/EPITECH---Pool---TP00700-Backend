defmodule Timemanagerbackend.Repo.Migrations.UserBelongsToClocks do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:clock_id, references(:clocks))
    end
  end
end
