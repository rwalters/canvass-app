defmodule CanvassApp.VotersController do
  use CanvassApp.Web, :controller
  require Logger

  alias CanvassApp.Voters

  def index(conn, _params) do
    voters = Repo.all(Voters)
    render(conn, "index.html", voters: voters)
  end

  def new(conn, _params) do
    changeset = Voters.changeset(%Voters{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"voters" => voters_params}) do
    Logger.info inspect(voters_params)
    changeset = Voters.changeset(%Voters{}, voters_params)
    Logger.info inspect(changeset)

    case Repo.insert(changeset) do
      {:ok, _voters} ->
        conn
        |> put_flash(:info, "Voters created successfully.")
        |> redirect(to: voters_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    voters = Repo.get!(Voters, id)
    render(conn, "show.html", voters: voters)
  end

  def edit(conn, %{"id" => id}) do
    voters = Repo.get!(Voters, id)
    changeset = Voters.changeset(voters)
    render(conn, "edit.html", voters: voters, changeset: changeset)
  end

  def update(conn, %{"id" => id, "voters" => voters_params}) do
    Logger.info inspect(voters_params)
    voters = Repo.get!(Voters, id)
    changeset = Voters.changeset(voters, voters_params)
    Logger.info inspect(changeset)

    case Repo.update(changeset) do
      {:ok, voters} ->
        conn
        |> put_flash(:info, "Voters updated successfully.")
        |> redirect(to: voters_path(conn, :show, voters))
      {:error, changeset} ->
        render(conn, "edit.html", voters: voters, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    voters = Repo.get!(Voters, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(voters)

    conn
    |> put_flash(:info, "Voters deleted successfully.")
    |> redirect(to: voters_path(conn, :index))
  end
end
