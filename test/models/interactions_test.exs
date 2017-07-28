defmodule CanvassApp.InteractionsTest do
  use CanvassApp.ModelCase

  alias CanvassApp.Interactions

  @valid_attrs %{dead: true, discussed: true, moved: true, not_home: true, other_language: true, refused: true, registered_to_change_affiliation: true, registered_to_vote: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Interactions.changeset(%Interactions{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Interactions.changeset(%Interactions{}, @invalid_attrs)
    refute changeset.valid?
  end
end
