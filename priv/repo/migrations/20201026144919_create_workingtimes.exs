defmodule Timemanagerbackend.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :user, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:workingtimes, [:user])
  end
end
