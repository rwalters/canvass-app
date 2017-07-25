# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :canvass_app,
  ecto_repos: [CanvassApp.Repo]

# Configures the endpoint
config :canvass_app, CanvassApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TE12NEVahZJFWdXYgJQtxNHVqVITc281/lso5uKj7VIhos6C4yDh9rAM6DQMCsZO",
  render_errors: [view: CanvassApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CanvassApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
