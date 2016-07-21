defmodule Gc.EnergyConsumptionTest do
  use ExUnit.Case, async: true

  @valid_attr %{
    consumption: 42,
    device_name: "Foobar",
    from: "2016-01-01T00:00:00Z",
    to: "2016-01-02T00:00:00Z"
  }

  describe ".changeset" do
    test "it builds a valid changeset" do
      changeset = Gc.EnergyConsumption.changeset(
        %Gc.EnergyConsumption{}, @valid_attr)
      assert changeset.valid?
    end

    test "it builds an invalid changeset when :consumption is missing" do
      params = @valid_attr |> Map.take([:device_name, :from, :to])
      changeset = Gc.EnergyConsumption.changeset(
        %Gc.EnergyConsumption{}, params)
      refute changeset.valid?
    end

    test "it builds an invalid changeset when :device_name is missing" do
      params = @valid_attr |> Map.take([:consumption, :from, :to])
      changeset = Gc.EnergyConsumption.changeset(
        %Gc.EnergyConsumption{}, params)
      refute changeset.valid?
    end

    test "it builds an invalid changeset when :from is missing" do
      params = @valid_attr |> Map.take([:consumption, :device_name, :to])
      changeset = Gc.EnergyConsumption.changeset(
        %Gc.EnergyConsumption{}, params)
      refute changeset.valid?
    end

    test "it builds an invalid changeset when :to is missing" do
      params = @valid_attr |> Map.take([:consumption, :device_name, :from])
      changeset = Gc.EnergyConsumption.changeset(
        %Gc.EnergyConsumption{}, params)
      refute changeset.valid?
    end
  end

  describe ".to_json" do
    test "it seializes a consumption struct" do
      struct = Map.merge(%Gc.EnergyConsumption{}, @valid_attr)
      params = Poison.decode! Gc.EnergyConsumption.to_json(struct), keys: :atoms
      assert params = Map.merge(@valid_attr, %{id: nil})
    end
  end
end
