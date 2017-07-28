defmodule CanvassApp.VotersControllerTest do
  use CanvassApp.ConnCase

  alias CanvassApp.Voters
  @valid_attrs %{address: "some content", category: "some content", email: "some content", name: "some content", only_call_for_vote_reminder: true, party_registration: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, voters_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing voters"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, voters_path(conn, :new)
    assert html_response(conn, 200) =~ "New voters"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, voters_path(conn, :create), voters: @valid_attrs
    assert redirected_to(conn) == voters_path(conn, :index)
    assert Repo.get_by(Voters, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, voters_path(conn, :create), voters: @invalid_attrs
    assert html_response(conn, 200) =~ "New voters"
  end

  test "shows chosen resource", %{conn: conn} do
    voters = Repo.insert! %Voters{}
    conn = get conn, voters_path(conn, :show, voters)
    assert html_response(conn, 200) =~ "Show voters"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, voters_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    voters = Repo.insert! %Voters{}
    conn = get conn, voters_path(conn, :edit, voters)
    assert html_response(conn, 200) =~ "Edit voters"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    voters = Repo.insert! %Voters{}
    conn = put conn, voters_path(conn, :update, voters), voters: @valid_attrs
    assert redirected_to(conn) == voters_path(conn, :show, voters)
    assert Repo.get_by(Voters, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    voters = Repo.insert! %Voters{}
    conn = put conn, voters_path(conn, :update, voters), voters: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit voters"
  end

  test "deletes chosen resource", %{conn: conn} do
    voters = Repo.insert! %Voters{}
    conn = delete conn, voters_path(conn, :delete, voters)
    assert redirected_to(conn) == voters_path(conn, :index)
    refute Repo.get(Voters, voters.id)
  end
end
