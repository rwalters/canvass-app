defmodule CanvassApp.Repo.Migrations.CreateInteractions do
  use Ecto.Migration

  def change do
    create table(:interactions) do
      add :discussed, :boolean, default: false, null: false
      add :registered_to_vote, :boolean, default: false, null: false
      add :registered_to_change_affiliation, :boolean, default: false, null: false
      add :refused, :boolean, default: false, null: false
      add :other_language, :boolean, default: false, null: false
      add :not_home, :boolean, default: false, null: false
      add :moved, :boolean, default: false, null: false
      add :dead, :boolean, default: false, null: false
      add :voter_id, references(:voters, on_delete: :nothing)

      timestamps()
    end
    create index(:interactions, [:voter_id])

  end
end
