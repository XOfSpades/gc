defmodule Gc.Controller.EnergyConsumption do
  # Post consumption of device in timeframe
  def post(conn, body) do
    { :ok, record } = Gc.EnergyConsumption.changeset(
      %Gc.EnergyConsumption{},
      body
    )
    |> Gc.Repo.insert

    {conn, 200, Gc.EnergyConsumption.to_json(record)}
  end

  # Get consumption of device
  def get(conn, params) do
    {conn, 200, "{}"}
  end
end
