defmodule CanvassApp.Repo.Migrations.AddNoFundraisingToVoters do
  use Ecto.Migration

  def change do
    alter table(:voters) do
      add :no_fundraising, :boolean, default: false, null: false
      add :ideas, :text
    end
  end
end
