defmodule Gc.EnergyConsumption do
  use Ecto.Schema

  schema "energy_consumptions" do
    field :device_name,  :string
    field :consumption,  :float
    field :from,         Ecto.DateTime
    field :to,           Ecto.DateTime
  end
end
