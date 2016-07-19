defmodule Gc.Controller.EnergyConsumptionTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Gc.Router.init([])

  describe("post consumption") do
    test "It responds with 200 OK" do
      conn = conn(:post, "/api/energy_consumption", "")
      |> Gc.Router.call(@opts)

      assert conn.status == 200
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
