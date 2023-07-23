defmodule App.GraphQL.Schema do
  use Absinthe.Schema

  alias App.Documents
  alias App.GraphQL

  import_types(GraphQL.Mutations)
  import_types(GraphQL.Queries)
  import_types(GraphQL.Types)

  query do
    import_fields(:book_queries)
    import_fields(:verse_queries)
  end

  mutation do
    import_fields(:book_mutations)
    import_fields(:session_mutations)
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
