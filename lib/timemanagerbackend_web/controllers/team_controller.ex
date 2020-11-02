defmodule TimemanagerbackendWeb.TeamController do
  use TimemanagerbackendWeb, :controller
  alias Timemanagerbackend.Repo
  alias Timemanagerbackend.Team

  def index(conn, _params) do
    teams = Repo.all(Team) |> Repo.preload([:users, users: [:workingtimes, :roles, :clock]])
    # ici je guette les associations nested
    # test = Repo.all(Ecto.assoc(role, :teams)) |> Repo.preload(:roles)
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

  def show(conn, _params) do
  end

  def update(conn, _params) do
  end
end
