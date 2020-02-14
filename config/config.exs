# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :playaround,
  ecto_repos: [Playaround.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :playaround, PlayaroundWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Fj8eguYGDHUt5l35spUV2Lcj6NtNd6CXNfPuA9L9WckDXPsDm/iew0yQeH64df4Z",
  render_errors: [view: PlayaroundWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Playaround.PubSub, adapter: Phoenix.PubSub.PG2]

config :playaround, PlayaroundWeb.Endpoint,
  live_view: [
    signing_salt: "SECRET_SALT"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
