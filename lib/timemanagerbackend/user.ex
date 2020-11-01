defmodule Timemanagerbackend.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder,
           only: [:id, :firstname, :lastname, :email, :password, :workingtimes, :roles, :clock]}

  schema "users" do
    field(:username, :string)
    field(:firstname, :string)
    field(:lastname, :string)
    field(:email, :string)
    field(:password, :string)
    has_many(:workingtimes, Timemanagerbackend.WorkingTime)
    belongs_to(:roles, Timemanagerbackend.Roles)
    belongs_to(:clock, Timemanagerbackend.Clock)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :firstname, :lastname, :password, :email])
    |> validate_required([:username, :firstname, :lastname, :password, :email])
    # |> validate_format(:id, "^\d+$")
    |> unique_constraint(:email, message: "Email already taken.")
    |> unique_constraint(:username, message: "Username already taken.")
  end
end
