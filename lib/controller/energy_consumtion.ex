defmodule Gc.Controller.EnergyConsumption do
  # Post consumption of device in timeframe
  def post(conn, body) do
    { :ok, record } = Model.changeset(%Gc.EnergyConsumption{}, body)
    |> Gc.Repo.insert

    {conn, 200, Model.to_json(record)}
  end

  # Get consumption of device
  def get(conn, params) do
    {conn, 200, "{}"}
  end
end
