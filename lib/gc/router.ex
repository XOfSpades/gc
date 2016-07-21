defmodule Gc.Router do
  import Plug.Conn
  use Plug.Router
  alias Gc.Controller.EnergyThreshold, as: ThresholdController
  alias Gc.Controller.EnergyConsumption, as: ConsumptionController

  plug Plug.Logger
  plug :match
  plug :dispatch

  post "/api/energy_consumption" do
    {conn, status, response} = ConsumptionController.post(conn, get_body(conn))
    send_resp(conn, status, response)
  end

  put "/api/energy_threshold" do
    {conn, status, response} = ThresholdController.update(conn, get_body(conn))
    send_resp(conn, status, response)
  end

  get "/api/energy_consumption" do
    params = Plug.Conn.fetch_query_params(conn).query_params
    {conn, status, response} = ConsumptionController.get(conn, params)
    send_resp(conn, status, response)
  end

  get "/api/energy_threshold" do
    params = Plug.Conn.fetch_query_params(conn).query_params
    {conn, status, response} = ThresholdController.get_current(conn, params)
    send_resp(conn, status, response)
  end

  defp get_body(conn) do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    body |> Poison.decode!
  end
end
