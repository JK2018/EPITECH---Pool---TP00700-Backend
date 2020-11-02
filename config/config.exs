# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_swagger, json_library: Jason

config :timemanagerbackend,
  ecto_repos: [Timemanagerbackend.Repo]

# Configures the endpoint
config :timemanagerbackend, TimemanagerbackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GQ8ltu9XjBCMBNmrPUYiuUvcO8KvANvOC0dJeQgaAq9mt5gcRy+HYBPZ88TF9KFw",
  render_errors: [view: TimemanagerbackendWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Timemanagerbackend.PubSub,
  live_view: [signing_salt: "SshUIB3B"]

# Configures swagger
config :timemanagerbackend, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      # phoenix routes will be converted to swagger paths
      router: TimemanagerbackendWeb.Router,
      # (optional) endpoint config used to set host, port and https schemes.
      endpoint: TimemanagerbackendWeb.Endpoint
    ]
  }

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
