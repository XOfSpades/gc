defmodule User do
  @derive [Poison.Encoder]
  use Ecto.Schema
  alias Ecto.Changeset

  schema "users" do
    field :email,               :string
    field :encrypted_password,  :string

    timestamps
  end

  @required_fields [:email, :encrypted_password]
end
