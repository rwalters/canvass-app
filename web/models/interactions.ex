defmodule CanvassApp.Interactions do
  use CanvassApp.Web, :model

  schema "interactions" do
    field :discussed, :boolean, default: false
    field :registered_to_vote, :boolean, default: false
    field :registered_to_change_affiliation, :boolean, default: false
    field :refused, :boolean, default: false
    field :other_language, :boolean, default: false
    field :not_home, :boolean, default: false
    field :moved, :boolean, default: false
    field :dead, :boolean, default: false
    belongs_to :voter, CanvassApp.Voter

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:discussed, :registered_to_vote, :registered_to_change_affiliation, :refused, :other_language, :not_home, :moved, :dead])
    |> validate_required([:discussed, :registered_to_vote, :registered_to_change_affiliation, :refused, :other_language, :not_home, :moved, :dead])
  end
end
