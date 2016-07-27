defmodule Gc.User do
  @derive [Poison.Encoder]
  use Ecto.Schema
  alias Ecto.Changeset
  alias Gc.Authenticate.Password

  schema "users" do
    field :email,               :string
    field :password,            :string, virtual: true
    field :encrypted_password,  :string

    timestamps
  end
end
