defmodule Timemanagerbackend.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
