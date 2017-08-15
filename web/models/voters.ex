defmodule CanvassApp.Voters do
  use CanvassApp.Web, :model

  schema "voters" do
    field :name, :string, null: false
    field :address, :string
    field :neighborhood, :string
    field :email, :string, null: false
    field :phone, :string, null: false
    field :category, :string
    field :party_registration, :string
    field :only_call_for_vote_reminder, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :address, :email, :phone, :category, :party_registration, :only_call_for_vote_reminder, :neighborhood])
    |> validate_required([:name, :address, :email, :category, :party_registration, :only_call_for_vote_reminder])
    |> validate_inclusion(:category, ~w(Committed Unaware Transactional))
    |> foreign_key_constraint(:voter_id)
  end
end
