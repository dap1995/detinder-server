# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :detinder,
  ecto_repos: [Detinder.Repo]

# Configures the endpoint
config :detinder, Detinder.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "47v0s/C9bso73Tdh1+d8pJd72fonzfABqGF4djcc4JQTy1BKDKjvJdZIPrz88wI/",
  render_errors: [view: Detinder.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Detinder.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
