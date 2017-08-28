defmodule BlogApp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :accounts_users_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:posts, [:accounts_users_id])
  end
end
