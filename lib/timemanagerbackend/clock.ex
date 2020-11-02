defmodule Timemanagerbackend.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :status, :time]}

  schema "clocks" do
    field(:status, :boolean, default: false)
    field(:time, :naive_datetime)
    has_one(:user, Timemanagerbackend.User)

    # timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:time, :status])
    |> validate_required([:time, :status, :user])
  end
end
