defmodule App.Documents.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :name, :string
    field :position, :integer

    belongs_to :user, App.Accounts.User

    has_many :verses, App.Documents.Verse

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name, :position])
    |> validate_required([:name, :position])
  end
end
