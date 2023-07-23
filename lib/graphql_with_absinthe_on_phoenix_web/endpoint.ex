defmodule GraphqlWithAbsintheOnPhoenixWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :graphql_with_absinthe_on_phoenix

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_graphql_with_absinthe_on_phoenix_key",
    signing_salt: "1B6X410x",
    same_site: "Lax"
  ]

  # socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :graphql_with_absinthe_on_phoenix
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug GraphqlWithAbsintheOnPhoenixWeb.Plugs.SetCurrentUser
  plug Absinthe.Plug, schema: GraphqlWithAbsintheOnPhoenix.GraphQL.Schema
end
