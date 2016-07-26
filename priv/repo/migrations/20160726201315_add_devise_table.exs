defmodule Gc.Repo.Migrations.AddDeviseTable do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :name,    :string
      add :user_id, :integer

      timestamps
    end

    alter table(:energy_consumptions) do
      remove :device_name
      add :device_id, :integer
    end
  end
end
