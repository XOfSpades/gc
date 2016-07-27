defmodule Gc.Controller.EnergyConsumptionTest do
  use ExUnit.Case, async: true
  use Plug.Test

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Gc.Repo)
  end

  @opts Gc.Router.init([])
  @consumption %Gc.EnergyConsumption{
    device_id: 34,
    consumption: 42,
    from: "2016-01-01T00:00:00Z",
    to: "2016-01-02T00:00:00Z"
  }

  setup do
    {:ok, device} =
      Model.changeset(%Gc.Device{}, %{ name: "TestDevise", user_id: 42 })
      |> Gc.Repo.insert

    energy_consumptions = [
      %{
        device_id: device.id,
        consumption: 1,
        from: "2016-01-01T00:00:00Z",
        to: "2016-01-02T00:00:00Z"
      },
      %{
        device_id: device.id,
        consumption: 2,
        from: "2016-01-02T00:00:00Z",
        to: "2016-01-03T00:00:00Z"
      },
      %{
        device_id: device.id + 1,
        consumption: 3,
        from: "2016-01-02T00:00:00Z",
        to: "2016-01-03T00:00:00Z"
      }
    ]
    |> Enum.map(&(Model.changeset(%Gc.EnergyConsumption{}, &1)))
    |> Enum.map(&(Gc.Repo.insert!(&1)))

    {:ok, %{device: device, energy_consumptions: energy_consumptions}}
  end

  describe("post consumption") do
    test "It responds with 200 OK" do
      request_body = Model.to_json(@consumption)
      conn = conn(:post, "/api/energy_consumption", request_body)
      |> Gc.Router.call(@opts)

      assert conn.status == 200
      response_body = Poison.decode!(conn.resp_body)

      record = Gc.Repo.get_by(Gc.EnergyConsumption, id: response_body["id"])
      assert record != nil
    end
  end

  describe("get consumption") do
    test "It responds with 200 OK",
         %{device: device, energy_consumptions: energy_consumptions} do
      conn = conn(:get, "/api/energy_consumption?device_id=#{device.id}")
      |> Gc.Router.call(@opts)

      assert conn.status == 200
    end

    test "It returns a time series of consumption values",
         %{device: device, energy_consumptions: energy_consumptions} do
      conn = conn(:get, "/api/energy_consumption?device_id=#{device.id}")
      |> Gc.Router.call(@opts)

      assert conn.status == 200
      response_body = Poison.decode!(conn.resp_body)
      assert length(response_body) == 2
      assert Enum.find(response_body, &(&1["consumption"] == 3)) == nil
    end
  end
end
