defmodule GraphqlWithAbsintheOnPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :graphql_with_absinthe_on_phoenix,
    adapter: Ecto.Adapters.Postgres
end
