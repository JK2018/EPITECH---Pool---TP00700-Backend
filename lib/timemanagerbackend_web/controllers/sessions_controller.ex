defmodule TimemanagerbackendWeb.SessionsController do
  require Logger
  use TimemanagerbackendWeb, :controller
  alias Timemanagerbackend.User
  alias Timemanagerbackend.Roles
  alias Timemanagerbackend.Repo

  def sign_up(conn, body_params) do
    role = Repo.get_by(Roles, label: "user")

    ch =
      User.changeset(%User{}, body_params)
      |> Ecto.Changeset.put_assoc(:roles, role)

    case Repo.insert(ch) do
      {:ok, _user} ->
        json(conn, %{result: "Utilisateur enregistré."})

      {:error, changeset} ->
        conn
        |> put_status(:bad_request)
        |> render(TimemanagerbackendWeb.ErrorView, "error.json", changeset: changeset)
    end
  end

  def sign_in(conn, body_params) do
    %{"email" => email, "password" => password} = body_params

    if email == nil or password == nil do
      conn |> put_status(:bad_request) |> json(%{error: "Email or password is missing."})
    else
      case Repo.get_by(User, email: email, password: password) |> Repo.preload(:roles) do
        nil ->
          conn |> put_status(:bad_request) |> json(%{error: "User not found."})

        user ->
          case Timemanagerbackend.Token.generate_and_sign(%{"email" => user.email}) do
            {:ok, oui, claims} ->
              json(conn, %{token: oui, claims: claims, user: claims})

            {:error, errors} ->
              conn |> put_status(:internal_server_error) |> json(%{error: errors})
          end
      end
    end
  end
end
