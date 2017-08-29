# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blog_app,
  ecto_repos: [BlogApp.Repo]

# Configures the endpoint
config :blog_app, BlogAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "X3cjV9OYdJW2SRXNaHQ8UkwnZ4uiRoIa3SI7FWNx4YkIsseqnQ7QRU2mFMM5b/xN",
  render_errors: [view: BlogAppWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BlogApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "BlogApp",
  ttl: { 30, :days },
  verify_issuer: true,
  secret_key: "Ht9ZbZqOM1mZw5asSI5FCJiO3cbjIShV6zlIkI262vTs2U689sy9gbZflusfJkYZ",
  serializer: BlogApp.GuardianSerializer
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

#  LocalWords:  ZbZqOM BlogApp
