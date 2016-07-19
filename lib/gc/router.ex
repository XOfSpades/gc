defmodule Gc.Router do
  import Plug.Conn
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  post "/api/energy_consumption" do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    {conn, status, response} = Gc.Controller.EnergyConsumption.post(conn, body)
    send_resp(conn, status, response)
  end
end
