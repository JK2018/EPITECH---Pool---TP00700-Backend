defmodule Timemanagerbackend.WorkingTime do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :end, :start]}

  schema "workingtimes" do
    field(:end, :naive_datetime)
    field(:start, :naive_datetime)
    belongs_to(:user, Timemanagerbackend.User)

    timestamps()
  end

  @doc false
  def changeset(working_time, attrs) do
    working_time
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end])
  end
end
