defmodule Timemanagerbackend.Roles do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:label]}

  schema "roles" do
    field(:label, :string)
    has_many(:users, Timemanagerbackend.User)

    timestamps()
  end

  @doc false
  def changeset(roles, attrs) do
    roles
    |> cast(attrs, [:label])
    |> validate_required([:label])
  end
end
