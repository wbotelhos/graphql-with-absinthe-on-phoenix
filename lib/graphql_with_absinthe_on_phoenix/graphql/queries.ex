defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Queries do
  use Absinthe.Schema.Notation

  alias GraphqlWithAbsintheOnPhoenix.GraphQL.Queries

  import_types(Queries.Book)
  import_types(Queries.Verse)
end
