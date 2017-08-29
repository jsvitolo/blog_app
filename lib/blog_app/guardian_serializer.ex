defmodule BlogApp.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias BlogApp.{Accounts.User, Repo}

  def for_token(user = %User{}), do: {:ok, "User:#{user.id}"}
  def for_token(_), do: {:error, "Unknown resources type"}

  def from_token("User:" <> id), do: {:ok, Repo.get(User, id)}
  def from_token(_), do: {:error, "Unknown resources type"}
end
