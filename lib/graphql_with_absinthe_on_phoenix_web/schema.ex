defmodule GraphqlWithAbsintheOnPhoenixWeb.Schema do
  use Absinthe.Schema

  alias GraphqlWithAbsintheOnPhoenix.Documents
  alias GraphqlWithAbsintheOnPhoenixWeb.Types

  import_types(Types.BookTypes)
  import_types(Types.VerseTypes)

  query do
    import_fields(:get_book)
    import_fields(:list_books)
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
