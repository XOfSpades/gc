defmodule Gc.Controller.EnergyThreshold do
  # Change threshold for notification
  def update(conn, body) do
    {conn, 200, "{}"}
  end

  # Get current threshold
  def get_current(conn, params) do
    {conn, 200, "{}"}
  end
end
