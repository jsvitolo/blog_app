defmodule BlogApp.Schema do
  use Absinthe.Schema
  import_types BlogApp.Schema.Types

  query do
    field :blog_posts, list_of(:blog_post) do
      resolve &BlogApp.Blog.PostResolver.all/2
    end

    field :accounts_users, list_of(:accounts_user) do
      resolve &BlogApp.Accounts.UserResolver.all/2
    end
  end

  mutation do
    field :create_blog_post, type: :blog_post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :accounts_users_id, non_null(:integer)

      resolve &BlogApp.Blog.PostResolver.create/2
    end

    field :update_blog_post, type: :blog_post do
      arg :id, non_null(:integer)
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :accounts_users_id, non_null(:integer)

      resolve &BlogApp.Blog.PostResolver.update/2
    end

    field :delete_blog_post, type: :blog_post do
      arg :id, non_null(:integer)

      resolve &BlogApp.Blog.PostResolver.delete/2
    end
  end
end
