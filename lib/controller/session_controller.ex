defmodule Gc.Controller.Session do
  def post(conn, body) do
    auth_result =
      with {:ok, user} <- Gc.User.find_by_email(body["email"]),
           true <- Gc.Authenticate.Password.is_password(
                     body["password"], user.encrypted_password),
      do: {:ok, user}
    case auth_result do
      {:ok, user} ->
        conn = Guardian.Plug.api_sign_in(conn, user)
        jwt = Guardian.Plug.current_token(conn)
        {:ok, claims} = Guardian.Plug.claims(conn)
        expires = Map.get(claims, "exp")

        new_conn = conn
        |> Plug.Conn.put_resp_header("authorization", "Bearer #{jwt}")
        |> Plug.Conn.put_resp_header("x-expires", "#{expires}")

        {new_conn, 200, login_response_body(user, jwt, expires)}
      _ -> {conn, 401, Poison.encode!(%{message: "Could not login"})}
    end
  end

  defp login_response_body(user, jwt, expires) do
    user_map = Map.take(user, Gc.User.serialized_fields)
    Poison.encode!(
      %{user: user_map, jwt: jwt, token_type: "Bearer", expires: expires})
  end
end
