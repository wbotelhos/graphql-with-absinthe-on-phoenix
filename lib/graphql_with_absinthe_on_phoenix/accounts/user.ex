defmodule GraphqlWithAbsintheOnPhoenix.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias GraphqlWithAbsintheOnPhoenix.Accounts.User

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many :books, GraphqlWithAbsintheOnPhoenix.Documents.Book

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> hash_password()
    |> validate_required([:email, :password_hash])
  end

  # private

  defp hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp hash_password(Ecto.Changeset = changeset), do: changeset
end
