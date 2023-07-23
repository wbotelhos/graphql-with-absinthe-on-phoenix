defmodule AppWeb.Plugs.SetCurrentUser do
  import Plug.Conn

  alias App.AuthToken
  alias App.Accounts

  def init(opts), do: opts

  def call(conn, _opts) do
    case get_user(conn) do
      nil -> conn
      user -> Absinthe.Plug.put_options(conn, context: %{current_user: user})
    end
  end

  # private

  defp get_user(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, user_id} <- AuthToken.verify(token),
         user <- Accounts.get_user!(user_id) do
      user
    else
      _error -> nil
    end
  end
end
