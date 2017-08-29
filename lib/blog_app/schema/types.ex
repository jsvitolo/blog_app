defmodule BlogApp.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: BlogApp.Repo

  object :accounts_user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :posts, list_of(:blog_post), resolve: assoc(:blog_posts)
  end

  input_object :update_user_params do
    field :name, :string
    field :email, :string
    field :password, :string
  end

  object :blog_post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :user, :accounts_user, resolve: assoc(:accounts_users)
  end

  input_object :update_post_params do
    field :title, :string
    field :body, :string
    field :accounts_users_id, :integer
  end

  object :session do
    field :token, :string
  end
end
