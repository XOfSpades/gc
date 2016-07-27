defmodule Gc.Controller.EnergyConsumption do
  import Ecto.Query, only: [from: 2]
  # Post consumption of device in timeframe
  def post(conn, body) do
    { :ok, record } = Model.changeset(%Gc.EnergyConsumption{}, body)
    |> Gc.Repo.insert

    {conn, 200, Model.to_json(record)}
  end

  # Get consumption of device
  def get(conn, params) do
    {device_id, _decimal_place} = Integer.parse(params["device_id"])
    query = Ecto.Query.from ec in Gc.EnergyConsumption,
                            where: ec.device_id == ^device_id
    consumptions = Gc.Repo.all(query)
    |> Enum.map(&(Map.take(&1, [:device_id, :consumption, :from, :to, :id])))

    resp = Poison.encode!(consumptions)
    {conn, 200, resp}
  end
end
