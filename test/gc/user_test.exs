defmodule Gc.UserTest do
  use ExUnit.Case, async: true

  @valid_attr %{
    email: "Kira@Katze.com",
    password: "Foobar"
  }

  describe ".changeset" do
    test "it builds a valid changeset" do
      changeset = Model.changeset(%Gc.User{}, @valid_attr)
      assert changeset.valid?
    end

    test "it builds an invalid changeset when :email is missing" do
      params = @valid_attr |> Map.take([:password])
      changeset = Model.changeset(%Gc.User{}, params)
      refute changeset.valid?
    end

    test "it builds an invalid changeset when :password is missing" do
      params = @valid_attr |> Map.take([:email])
      changeset = Model.changeset(%Gc.User{}, params)
      refute changeset.valid?
    end
  end
end
