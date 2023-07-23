defmodule App.GraphQL.Queries do
  use Absinthe.Schema.Notation

  alias App.GraphQL.Queries

  import_types(Queries.Book)
  import_types(Queries.Verse)
end
