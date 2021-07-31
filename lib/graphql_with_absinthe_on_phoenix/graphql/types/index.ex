defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Types.Index do
  use Absinthe.Schema.Notation

  alias GraphqlWithAbsintheOnPhoenix.GraphQL.Types

  import_types(Types.Book)
  import_types(Types.Verse)
end
