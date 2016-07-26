defprotocol Model do
  def to_json(_)
  def changeset(_, _)
end

defimpl Model, for: Gc.EnergyConsumption do
  def to_json(model) do
    model
    |> Map.take([:device_name, :consumption, :from, :to, :id])
    |> Poison.encode!
  end

  def changeset(model, params \\ :empty) do
    required_fields = [:device_name, :consumption, :from, :to]
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
    required_fields = [:email]
    model
    |> Ecto.Changeset.cast(params, required_fields)
    |> Ecto.Changeset.validate_required(required_fields)
  end
end
