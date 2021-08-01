defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Schema do
  use Absinthe.Schema

  alias GraphqlWithAbsintheOnPhoenix.Documents
  alias GraphqlWithAbsintheOnPhoenix.GraphQL

  import_types(GraphQL.Mutations.Index)
  import_types(GraphQL.Queries.Index)
  import_types(GraphQL.Types.Index)

  query do
    import_fields(:book_queries)
    import_fields(:verse_queries)
  end

  mutation do
    import_fields(:book_mutations)
  end

  # Dataloader

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Documents, Documents.datasource())

    Map.put(ctx, :loader, loader)
  end

  def plugins, do: [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
end
