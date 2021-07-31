defmodule GraphqlWithAbsintheOnPhoenixWeb.Resolvers.Verses do
  alias GraphqlWithAbsintheOnPhoenix.Documents

  def verses_for_book(book, _args, _context) do
    {:ok, Documents.verses_for_book(book)}
  end
end
