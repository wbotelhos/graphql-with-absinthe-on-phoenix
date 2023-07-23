defmodule App.AuthToken do
  @salt "any salt"

  alias AppWeb.Endpoint

  def create(user) do
    Phoenix.Token.sign(Endpoint, @salt, user.id)
  end

  def verify(token) do
    Phoenix.Token.verify(Endpoint, @salt, token, max_age: 60 * 60 * 24)
  end
end
