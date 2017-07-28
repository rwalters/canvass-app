defmodule CanvassApp.InteractionsController do
  use CanvassApp.Web, :controller

  alias CanvassApp.Interactions

  def index(conn, _params) do
    interactions = Repo.all(Interactions)
    render(conn, "index.html", interactions: interactions)
  end

  def new(conn, _params) do
    changeset = Interactions.changeset(%Interactions{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"interactions" => interactions_params}) do
    changeset = Interactions.changeset(%Interactions{}, interactions_params)

    case Repo.insert(changeset) do
      {:ok, _interactions} ->
        conn
        |> put_flash(:info, "Interactions created successfully.")
        |> redirect(to: interactions_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    interactions = Repo.get!(Interactions, id)
    render(conn, "show.html", interactions: interactions)
  end

  def edit(conn, %{"id" => id}) do
    interactions = Repo.get!(Interactions, id)
    changeset = Interactions.changeset(interactions)
    render(conn, "edit.html", interactions: interactions, changeset: changeset)
  end

  def update(conn, %{"id" => id, "interactions" => interactions_params}) do
    interactions = Repo.get!(Interactions, id)
    changeset = Interactions.changeset(interactions, interactions_params)

    case Repo.update(changeset) do
      {:ok, interactions} ->
        conn
        |> put_flash(:info, "Interactions updated successfully.")
        |> redirect(to: interactions_path(conn, :show, interactions))
      {:error, changeset} ->
        render(conn, "edit.html", interactions: interactions, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    interactions = Repo.get!(Interactions, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(interactions)

    conn
    |> put_flash(:info, "Interactions deleted successfully.")
    |> redirect(to: interactions_path(conn, :index))
  end
end
