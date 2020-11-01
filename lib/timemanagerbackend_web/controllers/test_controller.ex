defmodule TimemanagerbackendWeb.TestController do
  require Logger
  use TimemanagerbackendWeb, :controller
  alias Timemanagerbackend.Roles
  alias Timemanagerbackend.User
  alias Timemanagerbackend.Repo

  # GET BY ASSOC
  def index(conn, _params) do
    users = Repo.all(User) |> Repo.preload([:roles, :clock, :workingtimes])
    # ici je guette les associations nested
    # test = Repo.all(Ecto.assoc(role, :users)) |> Repo.preload(:roles)
    json(conn, %{users: users})
  end

  def roles(conn, _params) do
    role = Repo.get_by(Roles, label: "manager") |> Repo.preload(users: [:roles, :clock])
    json(conn, %{users: role.users})
  end
end
