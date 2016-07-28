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

  def find_by_email(email) do
    user = Gc.Repo.get_by(Gc.User, email: email) # body["email"]
    case user do
      nil -> {:error, "not found"}
      _ -> {:ok, user}
    end
  end

  def required_fields do
    [:email, :password]
  end

  def serialized_fields do
    [:email, :id]
  end
end
