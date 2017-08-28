defmodule BlogApp.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlogApp.Blog.Post


  schema "posts" do
    field :body, :string
    field :title, :string
    belongs_to :accounts_users, BlogApp.Accounts.User, foreign_key: :accounts_users_id

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
