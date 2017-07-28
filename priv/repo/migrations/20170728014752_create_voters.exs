defmodule CanvassApp.Repo.Migrations.CreateVoters do
  use Ecto.Migration

  def change do
    create table(:voters) do
      add :name, :string
      add :address, :string
      add :email, :string
      add :category, :string
      add :party_registration, :string
      add :only_call_for_vote_reminder, :boolean, default: false, null: false

      timestamps()
    end

  end
end
