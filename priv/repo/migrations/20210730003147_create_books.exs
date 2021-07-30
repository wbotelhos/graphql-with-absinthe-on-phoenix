defmodule GraphqlWithAbsintheOnPhoenix.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string
      add :position, :integer

      timestamps()
    end

  end
end
