defmodule GraphqlWithAbsintheOnPhoenix.Repo.Migrations.AddUserInBooks do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :user_id, references(:users)
    end
  end
end
