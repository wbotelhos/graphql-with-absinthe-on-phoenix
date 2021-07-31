defmodule GraphqlWithAbsintheOnPhoenix.Documents.Verse do
  use Ecto.Schema
  import Ecto.Changeset

  schema "verses" do
    field :body, :string
    field :chapter, :integer
    field :number, :integer

    belongs_to :book, GraphqlWithAbsintheOnPhoenix.Documents.Book

    timestamps()
  end

  @doc false
  def changeset(verse, attrs) do
    verse
    |> cast(attrs, [:chapter, :number, :body])
    |> validate_required([:chapter, :number, :body])
  end
end
