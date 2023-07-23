defmodule App.GraphQL.Queries.Book do
  use Absinthe.Schema.Notation

  alias App.GraphQL.Resolvers

  object :book_queries do
    field :books, list_of(:book) do
      arg(:limit, :integer)

      resolve(&Resolvers.Book.list_books/2)
    end

    field :book, :book do
      arg(:id, non_null(:integer))

      resolve(&Resolvers.Book.get_book/2)
    end
  end
end
