defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Types.Verse do
  use Absinthe.Schema.Notation

  object :verse do
    field :id, non_null(:id)
    field :chapter, non_null(:integer)
    field :number, non_null(:integer)
    field :body, non_null(:string)

    field :book, :book
  end
end
