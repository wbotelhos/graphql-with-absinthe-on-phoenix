defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Resolvers.Book do
  alias GraphqlWithAbsintheOnPhoenix.Documents

  def get_book(%{id: id}, _context) do
    {:ok, Documents.get_book!(id)}
  end

  def list_books(args, _context) do
    {:ok, Documents.list_books(args)}
  end
end
