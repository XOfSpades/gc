defmodule Gc.Controller.SessionTest do
  use ExUnit.Case, async: true
  use Plug.Test

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Gc.Repo)
  end

  setup do
    {:ok, user} = Model.changeset(
      %Gc.User{}, %{email: "kira@katze.com", password: "f00b4rBaz"})
    |> Gc.Repo.insert
    {:ok, %{user: user}}
  end

  @opts Gc.Router.init([])

  test "login with valid credentials return session", %{user: user} do
    request_body = Poison.encode!(%{email: user.email, password: user.password})
    conn = conn(:post, "/api/login", request_body)
    |> Gc.Router.call(@opts)

    assert conn.status == 200
    response_body = Poison.decode!(conn.resp_body)

    expected_user = %{"email" => "kira@katze.com", "id" => user.id}

    assert expected_user == response_body["user"]
    refute nil == response_body["expires"]
    refute nil == response_body["jwt"]
    assert response_body["token_type"] == "Bearer"
  end
end
