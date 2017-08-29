defmodule BlogAppWeb.Router do
  use BlogAppWeb, :router

  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug BlogApp.Context
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: BlogApp.Schema
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: BlogApp.Schema
end
