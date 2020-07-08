defmodule Okta.AuthnGetAuthenticationTest do
  use ExUnit.Case
  alias Okta.TestSupport.Helpers
  doctest Okta.Authn

  setup do
    token = "ssws_token"

    activation_token = "o7AFoTGE9xjQiHQK6dAa"

    client = Okta.client(Helpers.base_url(), token)

    {:ok, %{client: client, token: token, activation_token: activation_token}}
  end

  test "get_authentication/2 with activation_token", %{
    client: client,
    activation_token: activation_token
  } do
    Helpers.mock_request(
      path: "/api/v1/authn",
      method: :post,
      body: Jason.encode!(%{token: activation_token}),
      status: 200
    )

    assert {:ok, %{}, _env} = Okta.Authn.get_authentication(client, activation_token)
  end
end
