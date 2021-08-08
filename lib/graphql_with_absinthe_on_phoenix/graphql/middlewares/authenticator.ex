defmodule GraphqlWithAbsintheOnPhoenix.Middlewares.Authenticator do
  def call(resolution, _opts) do
    case resolution.context do
      %{current_user: _current_user} ->
        resolution

      _context ->
        Absinthe.Resolution.put_result(resolution, {:error, "Sign-in required!"})
    end
  end
end
