defmodule Gc.Device do
  @derive [Poison.Encoder]
  use Ecto.Schema
  alias Ecto.Changeset

  schema "devices" do
    field :name,    :string
    field :user_id, :integer

    timestamps
  end

  @required_fields [:name, :user_id]
end
