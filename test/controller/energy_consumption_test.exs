defmodule Gc.Controller.EnergyConsumptionTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Gc.Router.init([])

  test "It responds with 200 OK" do
    conn = conn(:post, "/api/energy_consumption", "")
    |> Gc.Router.call(@opts)

    assert conn.status == 200
  end
end
