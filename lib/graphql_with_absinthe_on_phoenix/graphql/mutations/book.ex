defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Mutations.Book do
  use Absinthe.Schema.Notation

  alias GraphqlWithAbsintheOnPhoenix.GraphQL.Resolvers

  object :book_mutations do
    field :create_book, :book do
      arg(:name, :string)
      arg(:position, :integer)

      arg(:verses, list_of(:verse_create_inputs))

      resolve(&Resolvers.Book.create_book/2)
    end
  end
end
