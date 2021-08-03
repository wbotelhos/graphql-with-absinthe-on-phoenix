defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :email, non_null(:string)
  end
end
