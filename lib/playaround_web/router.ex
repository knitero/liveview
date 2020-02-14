defmodule PlayaroundWeb.Router do
  use PlayaroundWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PlayaroundWeb.AssignUser
 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlayaroundWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/people", PersonLive
    live "/abantu", PersonLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", PlayaroundWeb do
  #   pipe_through :api
  # end
end
