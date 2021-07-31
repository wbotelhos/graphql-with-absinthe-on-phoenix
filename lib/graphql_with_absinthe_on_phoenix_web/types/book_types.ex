defmodule GraphqlWithAbsintheOnPhoenixWeb.Types.BookTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 3]

  alias GraphqlWithAbsintheOnPhoenix.Documents
  alias GraphqlWithAbsintheOnPhoenixWeb.Resolvers

  object :book do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :position, non_null(:integer)

    field :verses, list_of(:verse) do
      arg(:limit, :integer)

      resolve(dataloader(Documents, :verses, args: %{scope: :book}))
    end
  end

  object :get_book do
    field :book, :book do
      arg(:id, non_null(:integer))

      resolve(&Resolvers.Books.get_book/2)
    end
  end

  object :list_books do
    field :books, list_of(:book) do
      arg(:limit, :integer)

      resolve(&Resolvers.Books.list_books/2)
    end
  end
end
