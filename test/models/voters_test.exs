defmodule CanvassApp.VotersTest do
  use CanvassApp.ModelCase

  alias CanvassApp.Voters

  @valid_attrs %{address: "some content", category: "some content", email: "some content", name: "some content", only_call_for_vote_reminder: true, party_registration: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Voters.changeset(%Voters{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Voters.changeset(%Voters{}, @invalid_attrs)
    refute changeset.valid?
  end
end
