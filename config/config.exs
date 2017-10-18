# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ninescraft,
  ecto_repos: [Ninescraft.Repo]

# Configures the endpoint
config :ninescraft, NinescraftWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p6IstHk2KlL7OG+jjyWlN2VcteWnNDYXu+F0O2I843Vny2aKo63OB0A2jLPJ8qb5",
  render_errors: [view: NinescraftWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ninescraft.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
