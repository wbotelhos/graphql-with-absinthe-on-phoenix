defmodule GraphqlWithAbsintheOnPhoenix.GraphQL.Types.Book do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 3]

  alias GraphqlWithAbsintheOnPhoenix.Documents

  object :book do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :position, non_null(:integer)

    field :user, non_null(:user)

    field :verses, list_of(:verse) do
      arg(:limit, :integer)

      resolve(dataloader(Documents, :verses, args: %{scope: :book}))
    end
  end
end
