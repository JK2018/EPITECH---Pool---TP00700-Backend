defmodule TimemanagerbackendWeb.Plugs.Authenticate do
  require Logger
  import Plug.Conn

  def init(default), do: default

  def call(conn, _default) do
    case get_auth_token(conn) do
      {:ok, _token, claims} ->
        authorized(conn, claims["role"], claims["id"])

      # claims["userId"]

      _ ->
        unauthorized(conn)
    end
  end

  defp authorized(conn, userRole, userID) do
    conn
    |> assign(:signed_in, true)
    |> assign(:signed_user, userID)
    |> assign(:signed_user_role, userRole)
  end

  defp unauthorized(conn) do
    conn |> send_resp(401, "Unauthorized") |> halt()
  end

  def get_auth_token(conn) do
    case extract_token(conn) do
      {:ok, token} ->
        case Timemanagerbackend.Token.verify_and_validate(token) do
          {:ok, claims} ->
            {:ok, token, claims}

          {:error, errors} ->
            Logger.info("ERROR VERIFY :  #{inspect(errors)}")
            unauthorized(conn)
        end

      error ->
        error
    end
  end

  defp extract_token(conn) do
    case Plug.Conn.get_req_header(conn, "authorization") do
      [auth_header] -> get_token_from_header(auth_header)
      _ -> {:error, :missing_auth_header}
    end
  end

  defp get_token_from_header(auth_header) do
    {:ok, reg} = Regex.compile("Bearer\:?\s+(.*)$", "i")

    case Regex.run(reg, auth_header) do
      [_, match] ->
        {:ok, String.trim(match)}

      _ ->
        Logger.info("PAS DE TOKEN")
        {:error, "token not found"}
    end
  end
end
