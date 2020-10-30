defmodule TimemanagerbackendWeb.UserController do
  require Logger
  use TimemanagerbackendWeb, :controller
  alias Timemanagerbackend.User
  alias Timemanagerbackend.Repo

  def index(conn, _params) do
    Logger.info("ERROR VERIFY :  #{inspect(conn)}")
    users = Repo.all(User)
    json(conn, %{users: users})
  end

  def create(conn, params) do
    ch = User.changeset(%User{}, params)

    case Repo.insert(ch) do
      {:ok, user} ->
        json(conn, %{user: user})

      {:error, changeset} ->
        conn
        |> render(TimemanagerbackendWeb.ErrorView, "error.json", changeset: changeset)
    end
  end
end
