defmodule BlogAppWeb.Router do
  use BlogAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BlogAppWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
  end

  forward "/graph", Absinthe.Plug,
    schema: BlogApp.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: BlogApp.Schema
end
