# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :graphql_with_absinthe_on_phoenix,
  ecto_repos: [GraphqlWithAbsintheOnPhoenix.Repo]

# Configures the endpoint
config :graphql_with_absinthe_on_phoenix, GraphqlWithAbsintheOnPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZG2sN5QjU1jyhRJC8QZxuXDBgyp8AByoRgZkO88k9JTPTPXcdSVk7pX9R3t5RB9J",
  render_errors: [
    view: GraphqlWithAbsintheOnPhoenixWeb.ErrorView,
    accepts: ~w(json),
    layout: false
  ],
  pubsub_server: GraphqlWithAbsintheOnPhoenix.PubSub,
  live_view: [signing_salt: "H7OIkczM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
