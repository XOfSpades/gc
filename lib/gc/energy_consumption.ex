defmodule Gc.EnergyConsumption do
  @derive [Poison.Encoder]
  use Ecto.Schema
  alias Ecto.Changeset

  schema "energy_consumptions" do
    field :device_name,  :string
    field :consumption,  :float
    field :from,         Ecto.DateTime
    field :to,           Ecto.DateTime

    timestamps
  end

  @required_fields [:device_name, :consumption, :from, :to]
end
