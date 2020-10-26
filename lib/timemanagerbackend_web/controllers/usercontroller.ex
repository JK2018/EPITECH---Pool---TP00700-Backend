defmodule TimemanagerbackendWeb.UserController do
  use TimemanagerbackendWeb, :controller
  alias Timemanagerbackend.User
  alias Timemanagerbackend.Repo

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
