defmodule App.GraphQL.Resolvers.User do
  alias App.Accounts
  alias App.GraphQL
  alias App.AuthToken

  def signin(%{email: email, password: password}, _context) do
    case Accounts.authenticate(email, password) do
      {:ok, %Accounts.User{} = user} ->
        {:ok, %{token: AuthToken.create(user), user: %{email: user.email}}}

      {:error, changeset} ->
        {:error, message: "Signin failed!", details: GraphQL.Errors.extract(changeset)}
    end
  end

  def signup(args, _context) do
    case Accounts.create_user(args) do
      {:ok, %Accounts.User{} = user} ->
        {:ok, %{token: AuthToken.create(user), user: %{email: user.email}}}

      {:error, changeset} ->
        {:error, message: "Signup failed!", details: GraphQL.Errors.extract(changeset)}
    end
  end
end
