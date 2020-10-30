defmodule Timemanagerbackend.Token do
  use Joken.Config

  @derive {Poison.Encoder, except: [:__meta__]}

  @impl true
  def token_config do
    default_claims(skip: [:aud, :iat, :iss, :jti, :nbf])

    # |> add_claim("roles", nil, &(&1 in ["admin", "user"]))

    # |> add_claim("sub", nil, &is_valid_uuid/1)
  end
end
