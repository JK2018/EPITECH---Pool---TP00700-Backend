defmodule TimemanagerbackendWeb.TeamController do
  use TimemanagerbackendWeb, :controller
  alias Timemanagerbackend.Repo
  alias Timemanagerbackend.User
  alias Timemanagerbackend.Team

  def index(conn, _params) do
    teams = Repo.all(Team) |> Repo.preload([:users, users: [:workingtimes, :roles, :clock]])
    json(conn, %{teams: teams})
  end

  def create(conn, params) do
    ch = Team.changeset(%Team{}, params)

    case Repo.insert(ch) do
      {:ok, team} ->
        json(conn, %{team: Repo.preload(team, :users)})

      {:error, changeset} ->
        conn
        |> render(TimemanagerbackendWeb.ErrorView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id} = _params) do
    case Repo.get_by(Team, id: id)
         |> Repo.preload([:users, users: [:roles, :workingtimes, :clock]]) do
      nil ->
        json(conn, %{error: "Team not found."})

      team ->
        json(conn, %{result: team})
    end
  end

  def add(conn, %{"id" => id, "userID" => userid} = _params) do
    case Repo.get_by(Team, id: id) |> Repo.preload([:users]) do
      nil ->
        json(conn, %{error: "User not found"})

      team ->
        case Repo.get_by(User, id: userid) |> Repo.preload([:roles, :clock, :workingtimes]) do
          nil ->
            json(conn, %{error: "User not found."})

          user ->
            team
            |> Ecto.Changeset.change()
            |> Ecto.Changeset.put_assoc(:users, [user])
            |> Repo.update!()

            json(conn, "User #{user.id} à intégré la team n#{team.id}")
        end
    end
  end

  def update(conn, %{"id" => id} = params) do
    case Repo.get_by(Team, id: id)
         |> Repo.preload([:users, users: [:roles, :workingtimes, :clock]]) do
      nil ->
        json(conn, %{error: "Team not found."})

      team ->
        newTeam =
          Ecto.Changeset.change(team,
            name: params["name"] || team.name,
            description: params["description"] || team.description
          )

        case Repo.update(newTeam) do
          {:ok, struct} ->
            json(conn, %{newTeam: struct})

          {:error, changeset} ->
            conn |> put_status(:bad_request) |> json(%{error: changeset})
        end
    end
  end

  def delete(conn, %{"id" => id, "userID" => userID} = _params) do
    case Repo.get_by(Team, id: id) do
      nil ->
        json(conn, %{error: "Team not found."})

      _team ->
        case Repo.get_by(User, team_id: id, id: userID)
             |> Repo.preload([:workingtimes, :roles, :clock, :team]) do
          nil ->
            conn |> json(%{error: "Aucun utilisateur demandé dans cette team."})

          oui ->
            newUser = Ecto.Changeset.change(oui, team: nil)

            case Repo.update(newUser) do
              {:ok, _struct} ->
                json(conn, "Utilisateur retiré de la team.")

              {:error, changeset} ->
                conn |> put_status(:bad_request) |> json(%{error: changeset})
            end
        end
    end
  end

  def delete(conn, %{"id" => id} = _params) do
    case Repo.get_by(Team, id: id) do
      nil ->
        conn
        |> json(%{error: "Team not found."})

      team ->
        case Repo.delete(team) do
          nil ->
            json(conn, %{error: "Suppression impossible"})

          _team ->
            json(conn, "Team supprimé.")
        end
    end
  end
end
