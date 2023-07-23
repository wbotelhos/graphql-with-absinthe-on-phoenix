defmodule GraphqlWithAbsintheOnPhoenixWeb.Router do
  use GraphqlWithAbsintheOnPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]

    plug GraphqlWithAbsintheOnPhoenixWeb.Plugs.SetCurrentUser
  end

  scope "/api" do
    pipe_through :api

    forward "/", Absinthe.Plug, schema: GraphqlWithAbsintheOnPhoenix.GraphQL.Schema
  end
end
