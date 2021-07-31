defmodule GraphqlWithAbsintheOnPhoenixWeb.Schema do
  use Absinthe.Schema

  alias GraphqlWithAbsintheOnPhoenixWeb.Types

  import_types(Types.BookTypes)
  import_types(Types.VerseTypes)

  query do
    import_fields(:get_book)

    import_fields(:list_books)
    import_fields(:list_verses)
  end
end
