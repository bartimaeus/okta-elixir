defmodule Okta.Authn do
  @moduledoc """
  The `Okta.Authn` module provides access methods to the [Okta Authentication API](https://developer.okta.com/docs/reference/api/authn/).

  All methods require a Tesla Client struct created with `Okta.client(base_url, api_key)`.

  ## Examples

      client = Okta.Client("https://dev-000000.okta.com", "thisismykeycreatedinokta")
      {:ok, result, _env} = Okta.Authn.get_authentication(client, "activation_token")
  """

  @authn_url "/api/v1/authn"

  @doc """
  Fetch authentication by activation_token.

  https://developer.okta.com/docs/reference/api/authn/#primary-authentication-with-activation-token
  """
  @spec get_authentication(Okta.client(), String.t()) :: Okta.result()
  def get_authentication(client, activation_token) do
    data = %{token: activation_token}
    Tesla.post(client, @authn_url, data) |> Okta.result()
  end
end
