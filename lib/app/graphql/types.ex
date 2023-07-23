defmodule App.GraphQL.Types do
  use Absinthe.Schema.Notation

  alias App.GraphQL.Types

  import_types(Types.Book)
  import_types(Types.Session)
  import_types(Types.User)
  import_types(Types.Verse)
end
