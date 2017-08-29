defmodule BlogApp.Blog.PostResolver do
  alias BlogApp.{Blog.Post, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end

  def create(args, _info) do
    %Post{}
    |> Post.changeset(args)
    |> Repo.insert
  end

  def update(args, _info) do
    Repo.get!(Post, args.id)
    |> Post.changeset(args)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    Repo.get!(Post, id)
    |> Repo.delete
  end
end
