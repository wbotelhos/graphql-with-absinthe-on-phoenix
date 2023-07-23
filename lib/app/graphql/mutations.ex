defmodule App.GraphQL.Mutations do
  use Absinthe.Schema.Notation

  alias App.GraphQL.Mutations

  import_types(Mutations.Book)
  import_types(Mutations.Session)
end
