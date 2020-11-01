defmodule TimemanagerbackendWeb.WorkingTimeController do
  use TimemanagerbackendWeb, :controller
  # alias Timemanagerbackend.Clock
  alias Timemanagerbackend.User
  alias Timemanagerbackend.Repo

  def show(conn, %{"id" => id} = _params) do
    case Repo.get_by(User, id: id) |> Repo.preload([:workingtimes]) do
      nil ->
        json(conn, %{error: "User not found"})

      user ->
        test = Repo.all(Ecto.assoc(user, :workingtimes))
        json(conn, %{workingtimes: test})
        # case Repo.get_by(User, id: id) |> Repo.preload([:roles, :clock]) do
        #   nil -> json(conn, %{error: "User not found"})
        #   user -> json(conn, %{clock: user.clock})
        # end
    end
  end

  # def edit(conn, %{"id" => id} = _params) do
  #   case Repo.get_by(User, id: id) |> Repo.preload([:roles, :clock]) do
  #     nil -> json(conn, %{error: "User not found"})
  #     user -> json(conn, %{clock: user.clock})
  #   end
  # end
end
