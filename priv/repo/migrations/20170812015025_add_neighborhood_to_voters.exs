defmodule CanvassApp.Repo.Migrations.AddNeighborhoodToVoters do
  use Ecto.Migration

  def change do
    alter table(:voters) do
      add :neighborhood, :string
    end
  end
end
