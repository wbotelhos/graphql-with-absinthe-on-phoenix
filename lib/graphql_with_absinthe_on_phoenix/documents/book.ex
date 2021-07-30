defmodule GraphqlWithAbsintheOnPhoenix.Documents.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :name, :string
    field :position, :integer

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name, :position])
    |> validate_required([:name, :position])
  end
end
