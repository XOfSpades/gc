defmodule Gc.DeviceTest do
  use ExUnit.Case, async: true

  @valid_attr %{
    name: "Some cryptical devise name which is very long",
    user_id: 42
  }

  describe ".changeset" do
    test "it builds a valid changeset" do
      changeset = Model.changeset(%Gc.Device{}, @valid_attr)
      assert changeset.valid?
    end

    test "it builds an invalid changeset when :user_id is missing" do
      params = @valid_attr |> Map.take([:name])
      changeset = Model.changeset(%Gc.Device{}, params)
      refute changeset.valid?
    end

    test "it builds an invalid changeset when :name is missing" do
      params = @valid_attr |> Map.take([:user_id])
      changeset = Model.changeset(%Gc.Device{}, params)
      refute changeset.valid?
    end
  end
end
