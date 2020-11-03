defmodule TimemanagerbackendWeb.ManageController do
  use TimemanagerbackendWeb, :controller
  require Logger
  alias Timemanagerbackend.Roles
  alias Timemanagerbackend.User
  alias Timemanagerbackend.Repo

  def promote(conn, %{"userID" => id} = _params) do
    manager = Repo.get_by(Roles, label: "manager")

    # role = Repo.get_by(Roles, label: "general_manager")
    if conn.assigns.signed_user_role != "general_manager" do
      conn
      |> put_status(:unauthorized)
      |> json(%{error: "Vous n'avez pas les droits requis pour cette action."})
    else
      case Repo.get_by(User, id: id)
           |> Repo.preload([:roles, :workingtimes, :clock]) do
        nil ->
          conn |> json(%{error: "User not found."})

        user ->
          if user.roles.label == "user" do
            newUser =
              Ecto.Changeset.change(user,
                roles: manager
              )

            case Repo.update(newUser) do
              {:ok, struct} ->
                json(conn, %{result: "User #{user.firstname} promu.", user: struct})

              {:error, changeset} ->
                conn |> put_status(:bad_request) |> json(%{error: changeset})
            end
          else
            conn |> json(%{error: "User need to be employee to be promote."})
          end
      end
    end
  end

  def demote(conn, %{"userID" => id} = _params) do
    role = Repo.get_by(Roles, label: "general_manager")
    userRole = Repo.get_by(Roles, label: "user")

    # role = Repo.get_by(Roles, label: "general_manager")
    if conn.assigns.signed_user_role != role.label do
      conn
      |> put_status(:unauthorized)
      |> json(%{error: "You don't have rights to do this."})
    else
      case Repo.get_by(User, id: id)
           |> Repo.preload([:roles, :workingtimes, :clock]) do
        nil ->
          conn |> json(%{error: "User not found."})

        user ->
          if user.roles.label == "manager" do
            newUser =
              Ecto.Changeset.change(user,
                roles: userRole
              )

            case Repo.update(newUser) do
              {:ok, struct} ->
                json(conn, %{result: "User \"#{user.firstname}\" demote.", user: struct})

              {:error, changeset} ->
                conn |> put_status(:bad_request) |> json(%{error: changeset})
            end
          else
            conn |> json(%{error: "User need to be manager to be demote."})
          end
      end
    end
  end
end
