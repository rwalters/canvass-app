defmodule CanvassApp.Router do
  use CanvassApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CanvassApp do
    pipe_through :browser # Use the default browser stack

    resources "/voters", VotersController

    resources "/interactions", InteractionsController

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", CanvassApp do
  #   pipe_through :api
  # end
end
