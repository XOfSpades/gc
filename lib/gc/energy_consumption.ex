defmodule Gc.EnergyConsumption do
  @derive [Poison.Encoder]
  use Ecto.Schema
  alias Ecto.Changeset

  schema "energy_consumptions" do
    field :device_id,    :integer
    field :consumption,  :float
    field :from,         Ecto.DateTime
    field :to,           Ecto.DateTime

    timestamps
  end

  def required_fields do
    [:device_id, :consumption, :from, :to]
  end

  def serialized_fields do
    [:id|required_fields]
  end
end
