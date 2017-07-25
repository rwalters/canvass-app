defmodule CanvassApp.User do
  use CanvassApp.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string
    field :password_confirmation, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :password_confirmation])
    |> validate_required([:email, :password, :password_confirmation])
  end
end
