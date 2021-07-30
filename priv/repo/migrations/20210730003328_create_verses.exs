defmodule GraphqlWithAbsintheOnPhoenix.Repo.Migrations.CreateVerses do
  use Ecto.Migration

  def change do
    create table(:verses) do
      add :chapter, :integer
      add :number, :integer
      add :body, :string
      add :book_id, references(:books, on_delete: :nothing)

      timestamps()
    end

    create index(:verses, [:book_id])
  end
end
