defmodule Timemanagerbackend.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :description, :id, :users]}

  schema "teams" do
    field(:description, :string)
    field(:name, :string)
    # has_one(:manager, Timemanagerbackend.User)
    has_many(:users, Timemanagerbackend.User, on_delete: :nilify_all)

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name, message: "Name already taken.")

    # |> foreign_key_constraint(:users, message: "test")
  end
end
