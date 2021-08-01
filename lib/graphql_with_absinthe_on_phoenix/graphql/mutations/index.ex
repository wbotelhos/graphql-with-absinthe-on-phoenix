defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Mutations.Index do
  use Absinthe.Schema.Notation

  alias GraphqlWithAbsintheOnPhoenix.GraphQL.Mutations

  import_types(Mutations.Book)
end
