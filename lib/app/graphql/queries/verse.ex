defmodule App.GraphQL.Queries.Verse do
  use Absinthe.Schema.Notation

  object :verse_queries do
    field :verses, list_of(:verse)
  end
end
