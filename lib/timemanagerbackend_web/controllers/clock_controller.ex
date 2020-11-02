defmodule TimemanagerbackendWeb.ClockController do
  use TimemanagerbackendWeb, :controller
  alias Timemanagerbackend.Clock
  alias Timemanagerbackend.User
  alias Timemanagerbackend.Repo

  def show(conn, %{"id" => id} = _params) do
    case Repo.get_by(User, id: id) |> Repo.preload([:roles, :clock]) do
      nil -> json(conn, %{error: "User not found"})
      user -> json(conn, %{clock: user.clock})
    end
  end

  def toggle(conn, %{"id" => id} = _params) do
    case Repo.get_by(User, id: id) |> Repo.preload([:roles, :clock]) do
      nil ->
        json(conn, %{error: "User not found"})

      user ->
        case Repo.get_by(Clock, id: user.clock.id) do
          nil ->
            json(conn, %{error: "Cet Utilisateur ne possède pas de Clock."})

          clock ->
            if clock.status == false do
              newClock =
                Ecto.Changeset.change(clock,
                  status: true,
                  time: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
                )

              case Repo.update(newClock) do
                {:ok, struct} ->
                  json(conn, %{newclock: struct})

                {:error, changeset} ->
                  conn |> put_status(:bad_request) |> json(%{error: changeset})
              end
            else
              newClock = Ecto.Changeset.change(clock, status: false, time: nil)

              # changeset = User.changeset(%User{}, %{age: 0, email: "mary@example.com"})
              newUser =
                Ecto.build_assoc(user, :workingtimes, %{
                  start: clock.time,
                  end: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
                })

              case Repo.update(newClock) do
                {:ok, struct} ->
                  case Repo.insert(newUser) do
                    {:ok, res} ->
                      json(conn, %{clock: struct, workingTime: res})

                    {:error, changeset} ->
                      conn |> put_status(:bad_request) |> json(%{error: changeset})
                  end

                {:error, changeset} ->
                  conn |> put_status(:bad_request) |> json(%{error: changeset})
              end
            end
        end
    end
  end
end
