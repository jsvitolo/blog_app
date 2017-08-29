defmodule BlogApp.Accounts.UserResolver do
  alias BlogApp.{Accounts.User, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end

  def update(%{id: id, user: user_params}, _info) do
    Repo.get!(User, id)
    |> User.update_changeset(user_params)
    |> Repo.update
  end
end
