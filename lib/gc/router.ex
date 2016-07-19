defmodule Gc.Router do
  import Plug.Conn
  use Plug.Router
  alias Gc.Controller.EnergyThreshold, as: ThresholdController
  alias Gc.Controller.EnergyConsumption, as: ConsumptionController

  plug Plug.Logger
  plug :match
  plug :dispatch

  post "/api/energy_consumption" do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    {conn, status, response} = ConsumptionController.post(conn, body)
    send_resp(conn, status, response)
  end

  put "/api/energy_threshold" do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    {conn, status, response} = ThresholdController.update(conn, body)
    send_resp(conn, status, response)
  end

  get "/api/energy_consumption" do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    {conn, status, response} = ConsumptionController.get(conn, body)
    send_resp(conn, status, response)
  end

  get "/api/energy_threshold" do
    IO.inspect conn
    {:ok, body, _} = Plug.Conn.read_body(conn)
    {conn, status, response} = ThresholdController.get_current(conn, body)
    send_resp(conn, status, response)
  end
end
