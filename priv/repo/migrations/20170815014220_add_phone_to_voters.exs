defmodule CanvassApp.Repo.Migrations.AddPhoneToVoters do
  use Ecto.Migration

  def change do
    alter table(:voters) do
      add :phone, :string
    end
  end
end
