defmodule CanvassApp.Voters do
  use CanvassApp.Web, :model

  schema "voters" do
    field :name, :string
    field :address, :string
    field :email, :string
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
    |> cast(params, [:name, :address, :email, :category, :party_registration, :only_call_for_vote_reminder])
    |> validate_required([:name, :address, :email, :category, :party_registration, :only_call_for_vote_reminder])
    |> validate_inclusion(:category, ~w(Committed Unaware Transactional))
    |> foreign_key_constraint(:voter_id)
  end
end
