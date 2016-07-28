defmodule Gc.UserTest do
  use ExUnit.Case, async: true

  @valid_attr %{
    email: "Kira@Katze.com",
    password: "Foobar"
  }

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Gc.Repo)
  end

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

  describe ".to_json" do
    test "it seializes a user struct" do
      user = Map.merge(%Gc.User{}, @valid_attr)
      params = Poison.decode! Model.to_json(user), keys: :atoms
      assert params == %{id: nil, email: "Kira@Katze.com"}
    end
  end

  describe ".find_by_email" do
    test "finds a user by email" do
      db_user = Model.changeset(%Gc.User{}, @valid_attr)
      |> Gc.Repo.insert!

      expected_user = Map.merge(db_user, %{password: nil})
      {:ok, record} = Gc.User.find_by_email(expected_user.email)
      assert expected_user == record
    end
  end
end
