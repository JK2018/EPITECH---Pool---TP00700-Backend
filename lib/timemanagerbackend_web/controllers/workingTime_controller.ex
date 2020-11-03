defmodule TimemanagerbackendWeb.WorkingTimeController do
  use TimemanagerbackendWeb, :controller
  import Ecto.Query
  use PhoenixSwagger
  alias Timemanagerbackend.User
  alias Timemanagerbackend.WorkingTime
  alias Timemanagerbackend.Repo

  # RETURN WORKINGTIMES BETWEEN START AND END OF THE GIVEN USER ID
  def show(conn, %{"userID" => id, "start" => start, "end" => end_time} = _params) do
    naive_start = NaiveDateTime.from_iso8601!(start)
    naive_end = NaiveDateTime.from_iso8601!(end_time)

    query =
      from(m in User,
        where: m.id == ^id,
        join: c in WorkingTime,
        on: c.user_id == m.id,
        where: c.start > ^naive_start and c.end < ^naive_end,
        select: c
      )

    repo = Repo.all(query)
    json(conn, %{result: repo})
  end

  # RETURN ONE WORKINGTIME OF THE GIVEN USER ID
  def show(conn, %{"userID" => id, "workingtimeID" => workingtime} = _params) do
    query =
      from(m in User,
        where: m.id == ^id,
        join: c in WorkingTime,
        on: c.user_id == m.id,
        where: c.id == ^workingtime,
        select: c
      )

    repo = Repo.all(query)
    json(conn, %{result: repo})
  end

  # RETURN ALL USER'S WORKINGTIMES
  def show(conn, %{"userID" => id} = _params) do
    case Repo.get_by(User, id: id) |> Repo.preload([:workingtimes]) do
      nil ->
        json(conn, %{error: "User not found"})

      user ->
        test = Repo.all(Ecto.assoc(user, :workingtimes))
        json(conn, %{workingtimes: test})
    end
  end

  def create(conn, %{"userID" => id, "start" => start, "end" => end_time} = _params) do
    wt = %WorkingTime{
      start: NaiveDateTime.truncate(NaiveDateTime.from_iso8601!(start), :second),
      end: NaiveDateTime.truncate(NaiveDateTime.from_iso8601!(end_time), :second)
    }

    case Repo.get_by(User, id: id) do
      nil ->
        json(conn, %{error: "User not found."})

      user ->
        maj = Ecto.build_assoc(user, :workingtimes, wt)
        Repo.insert!(maj)
        json(conn, %{result: "WorkTimes enregistré.", wt: wt})
    end
  end

  # UPDATE A WORKINGTIME
  def update(conn, %{"id" => id, "start" => start, "end" => end_time} = _params) do
    case Repo.get_by(WorkingTime, id: id) do
      nil ->
        json(conn, %{error: "WorkingTime not found."})

      wt ->
        newWT =
          Ecto.Changeset.change(wt,
            start: NaiveDateTime.truncate(NaiveDateTime.from_iso8601!(start), :second),
            end: NaiveDateTime.truncate(NaiveDateTime.from_iso8601!(end_time), :second)
          )

        case Repo.update(newWT) do
          {:ok, struct} ->
            json(conn, %{newclock: struct})

          {:error, changeset} ->
            conn |> put_status(:bad_request) |> json(%{error: changeset})
        end
    end
  end

  def delete(conn, %{"id" => id} = _params) do
    repo = Repo.get_by(WorkingTime, id: id)

    case Repo.delete(repo) do
      nil -> json(conn, %{error: "WorkingTime not found."})
      wt -> json(conn, %{result: wt})
    end
  end
end
