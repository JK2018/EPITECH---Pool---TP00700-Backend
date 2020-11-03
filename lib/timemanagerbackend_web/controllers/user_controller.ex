defmodule TimemanagerbackendWeb.UserController do
  use TimemanagerbackendWeb, :controller
  alias Timemanagerbackend.User
  alias Timemanagerbackend.Clock
  alias Timemanagerbackend.Roles
  alias Timemanagerbackend.Repo

  def index(conn, _params) do
    users = Repo.all(User) |> Repo.preload([:workingtimes, :roles, :clock])
    json(conn, %{users: users})
  end

  def show(conn, %{"id" => id} = _params) do
    case Repo.get_by(User, id: id) |> Repo.preload([:workingtimes, :roles, :clock]) do
      nil ->
        conn |> put_status(:bad_request) |> json(%{error: "User not found."})

      user ->
        json(conn, %{user: user})
    end
  end

  def update(conn, %{"id" => id} = params) do
    case Repo.get_by(User, id: id)
         |> Repo.preload([:roles, :workingtimes, :clock]) do
      nil ->
        conn |> put_status(:bad_request) |> json(%{error: "User not found."})

      user ->
        newUser =
          Ecto.Changeset.change(user,
            username: params["username"] || user.username,
            firstname: params["firstname"] || user.firstname,
            lastname: params["lastname"] || user.lastname,
            email: params["email"] || user.email,
            password: params["password"] || user.password
          )

        case Repo.update(newUser) do
          {:ok, struct} ->
            json(conn, %{newUser: struct})

          {:error, changeset} ->
            conn |> put_status(:bad_request) |> json(%{error: changeset})
        end
    end
  end

  def create(conn, params) do
    role = Repo.get_by(Roles, label: "user")

    ch =
      User.changeset(%User{}, params)
      |> Ecto.Changeset.put_assoc(:roles, role)
      |> Ecto.Changeset.put_assoc(:clock, %Clock{status: false, time: nil})

    case Repo.insert(ch) do
      {:ok, user} ->
        json(conn, %{user: Repo.preload(user, [:workingtimes, :roles, :clock])})

      {:error, changeset} ->
        conn
        |> put_status(:bad_request)
        |> render(TimemanagerbackendWeb.ErrorView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id} = _params) do
    case Repo.get_by(User, id: id) do
      nil ->
        conn
        |> put_status(:bad_request)
        |> json(%{error: "User not found"})

      user ->
        if conn.assigns.signed_user_role == "general_manager" or
             conn.assigns.signed_user == elem(Integer.parse(id), 0) do
          case Repo.delete(user) do
            nil ->
              conn
              |> put_status(:internal_server_error)
              |> json(%{error: "Suppression impossible"})

            _user ->
              json(conn, "User supprimé.")
          end
        else
          conn
          |> put_status(:unauthorized)
          |> json(%{error: "You don't have rights to do this."})
        end
    end
  end
end
