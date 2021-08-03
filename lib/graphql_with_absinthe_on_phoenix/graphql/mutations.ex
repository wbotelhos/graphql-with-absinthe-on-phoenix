defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Mutations do
  use Absinthe.Schema.Notation

  alias GraphqlWithAbsintheOnPhoenix.GraphQL.Mutations

  import_types(Mutations.Book)
  import_types(Mutations.Session)
end
