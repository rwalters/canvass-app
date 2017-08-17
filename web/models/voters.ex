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
    field :no_fundraising, :boolean, default: false
    field :ideas, :string

    timestamps()
  end

  @required_fields [:name, :address, :email, :phone, :category, :party_registration, :neighborhood]
  @optional_fields [:phone, :only_call_for_vote_reminder, :no_fundraising, :ideas]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:category, ~w(Committed Unaware Transactional))
    |> foreign_key_constraint(:voter_id)
  end
end
