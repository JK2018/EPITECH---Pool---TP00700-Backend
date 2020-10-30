defmodule TimemanagerbackendWeb.TestController do
  require Logger
  use TimemanagerbackendWeb, :controller
  # alias Timemanagerbackend.User
  alias Timemanagerbackend.Roles
  alias Timemanagerbackend.Repo

  # GET BY ASSOC
  def index(conn, _params) do
    role = Repo.get_by(Roles, label: "user") |> Repo.preload(users: [:roles])
    # ici je guette les associations nested
    # test = Repo.all(Ecto.assoc(role, :users)) |> Repo.preload(:roles)
    json(conn, %{test: role.users})
  end

  def roles(conn, _params) do
    roles = Repo.all(Roles) |> Repo.preload(:users)
    json(conn, %{roles: roles})
  end
end
