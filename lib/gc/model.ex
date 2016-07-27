defprotocol Model do
  def to_json(_)
  def changeset(_, _)
end

defimpl Model, for: Gc.EnergyConsumption do
  def to_json(model) do
    model
    |> Map.take(Gc.EnergyConsumption.serialized_fields)
    |> Poison.encode!
  end

  def changeset(model, params \\ :empty) do
    required_fields = Gc.EnergyConsumption.required_fields
    model
    |> Ecto.Changeset.cast(params, required_fields)
    |> Ecto.Changeset.validate_required(required_fields)
  end
end

defimpl Model, for: Gc.User do
  def to_json(model) do
    model
    |> Map.take([:email, :id])
    |> Poison.encode!
  end

  def changeset(model, params \\ :empty) do
    required_fields = [:email, :password]
    model
    |> Ecto.Changeset.cast(params, required_fields)
    |> Ecto.Changeset.validate_required(required_fields)
    |> encrypt_password
  end

  defp encrypt_password(changeset) do
    password = changeset.params["password"]
    if is_bitstring(password) do
      Ecto.Changeset.put_change(
        changeset,
        :encrypted_password,
        Gc.Authenticate.Password.salt_and_hash(password))
    else
      Ecto.Changeset.add_error(changeset, :password, "is not a bitstring")
    end
  end
end

defimpl Model, for: Gc.Device do
  def to_json(model) do
    model
    |> Map.take([:name, :user_id, :id])
    |> Poison.encode!
  end

  def changeset(model, params \\ :empty) do
    required_fields = [:name, :user_id]
    model
    |> Ecto.Changeset.cast(params, required_fields)
    |> Ecto.Changeset.validate_required(required_fields)
  end
end

