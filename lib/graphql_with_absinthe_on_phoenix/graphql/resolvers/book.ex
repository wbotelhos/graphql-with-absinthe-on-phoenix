defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Resolvers.Book do
  alias GraphqlWithAbsintheOnPhoenix.Documents
  alias GraphqlWithAbsintheOnPhoenix.GraphQL

  def create_book(args, %{context: %{current_user: current_user}}) do
    args
    |> Map.put(:current_user, current_user)
    |> Documents.create_book()
    |> case do
      {:ok, book} ->
        {:ok, book}

      {:error, changeset} ->
        {:error, message: "Book creation failed!", details: GraphQL.Errors.extract(changeset)}
    end
  end

  def get_book(%{id: id}, _context) do
    {:ok, Documents.get_book!(id)}
  end

  def list_books(args, _context) do
    {:ok, Documents.list_books(args)}
  end
end
