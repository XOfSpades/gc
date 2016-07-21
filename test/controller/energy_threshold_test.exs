defmodule Gc.Controller.EnergyThresholdTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Gc.Router.init([])

  describe("update threshold") do
    test "It responds with 200 OK" do
      conn = conn(:put, "/api/energy_threshold", "{}")
      |> Gc.Router.call(@opts)

      assert conn.status == 200
    end
  end

  describe("get threshold") do
    test "It responds with 200 OK" do
      conn = conn(:get, "/api/energy_threshold")
      |> Gc.Router.call(@opts)

      assert conn.status == 200
    end
  end
end
