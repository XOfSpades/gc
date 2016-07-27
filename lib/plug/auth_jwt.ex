defmodule Plug.AuthJWT do
  # import Plug.Conn
  # require Logger

  # def init(options) do
  #   Keyword.put_new(options, :halt, true)
  # end

  # def call(%{assigns: %{authorized: true}} = conn, _options), do: conn
  # def call(conn, options) do
  #   result =
  #     with {:ok, token} <- fetch_token(conn),
  #          {:ok, user} <- verify_and_retrieve_user(token),
  #     do: {:ok, authorize(conn, user)}

  #   case result do
  #     {:ok, conn} -> conn
  #     {:error, error_message} -> send_unauthenticated(conn)
  #   end
  # end

  # defp send_unauthenticated(conn) do
  #   send_resp(conn, 401, Poison.encode!(%{errors: ["unauthenticated"]})) |> halt
  # end


end


# assign(conn, :current_tenant, %{
#         id: Map.get(user, "tenant_id"),
#         time_zone: Map.get(user, "time_zone"),
#         team_user: has_team_service?(user) })
#       |> assign(:authorized, true)
