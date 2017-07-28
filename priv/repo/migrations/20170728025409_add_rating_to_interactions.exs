defmodule CanvassApp.Repo.Migrations.AddRatingToInteractions do
  use Ecto.Migration

  def change do
    alter table(:interactions) do
      add :rating, :integer, default: 1, null: false
    end

  end
end
