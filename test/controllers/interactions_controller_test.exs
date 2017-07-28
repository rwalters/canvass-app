defmodule CanvassApp.InteractionsControllerTest do
  use CanvassApp.ConnCase

  alias CanvassApp.Interactions
  @valid_attrs %{dead: true, discussed: true, moved: true, not_home: true, other_language: true, refused: true, registered_to_change_affiliation: true, registered_to_vote: true}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, interactions_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing interactions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, interactions_path(conn, :new)
    assert html_response(conn, 200) =~ "New interactions"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, interactions_path(conn, :create), interactions: @valid_attrs
    assert redirected_to(conn) == interactions_path(conn, :index)
    assert Repo.get_by(Interactions, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, interactions_path(conn, :create), interactions: @invalid_attrs
    assert html_response(conn, 200) =~ "New interactions"
  end

  test "shows chosen resource", %{conn: conn} do
    interactions = Repo.insert! %Interactions{}
    conn = get conn, interactions_path(conn, :show, interactions)
    assert html_response(conn, 200) =~ "Show interactions"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, interactions_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    interactions = Repo.insert! %Interactions{}
    conn = get conn, interactions_path(conn, :edit, interactions)
    assert html_response(conn, 200) =~ "Edit interactions"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    interactions = Repo.insert! %Interactions{}
    conn = put conn, interactions_path(conn, :update, interactions), interactions: @valid_attrs
    assert redirected_to(conn) == interactions_path(conn, :show, interactions)
    assert Repo.get_by(Interactions, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    interactions = Repo.insert! %Interactions{}
    conn = put conn, interactions_path(conn, :update, interactions), interactions: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit interactions"
  end

  test "deletes chosen resource", %{conn: conn} do
    interactions = Repo.insert! %Interactions{}
    conn = delete conn, interactions_path(conn, :delete, interactions)
    assert redirected_to(conn) == interactions_path(conn, :index)
    refute Repo.get(Interactions, interactions.id)
  end
end
