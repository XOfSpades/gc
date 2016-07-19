defmodule Gc.Repo.Migrations.CreateComsumptionTable do
  use Ecto.Migration

  def change do
    create table(:energy_consumptions) do
      add :device_name, :string
      add :consumption, :float
      add :from,        :datetime
      add :to,          :datetime

      timestamps
    end
  end
end
