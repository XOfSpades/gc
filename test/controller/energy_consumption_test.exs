defmodule Gc.Controller.EnergyConsumptionTest do
  use ExUnit.Case, async: true
  use Plug.Test

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Gc.Repo)
  end

  @opts Gc.Router.init([])
  @consumption %Gc.EnergyConsumption{
    device_name: "Some_cryptical_device_name",
    consumption: 42,
    from: "2016-01-01T00:00:00Z",
    to: "2016-01-02T00:00:00Z"
  }

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
    test "It responds with 200 OK" do
      conn = conn(:get, "/api/energy_consumption")
      |> Gc.Router.call(@opts)

      assert conn.status == 200
    end
  end
end
