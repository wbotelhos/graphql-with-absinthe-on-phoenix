defmodule App.GraphQL.Mutations.Session do
  use Absinthe.Schema.Notation

  alias App.GraphQL.Resolvers

  object :session_mutations do
    field :signin, :session do
      arg(:email, :string)
      arg(:password, :string)

      resolve(&Resolvers.User.signin/2)
    end

    field :signup, :session do
      arg(:email, :string)
      arg(:password, :string)

      resolve(&Resolvers.User.signup/2)
    end
  end
end
