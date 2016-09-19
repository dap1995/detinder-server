defmodule Detinder.DetentoController do
  use Detinder.Web, :controller

  alias Detinder.Detento

  def index(conn, _params) do
    detentos = Repo.all(Detento)
    render(conn, "index.json", detentos: detentos)
  end

  def create(conn, %{"detento" => detento_params}) do
    changeset = Detento.changeset(%Detento{}, detento_params)

    case Repo.insert(changeset) do
      {:ok, detento} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", detento_path(conn, :show, detento))
        |> render("show.json", detento: detento)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Detinder.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    detento = Repo.get!(Detento, id)
    render(conn, "show.json", detento: detento)
  end

  def update(conn, %{"id" => id, "detento" => detento_params}) do
    detento = Repo.get!(Detento, id)
    changeset = Detento.changeset(detento, detento_params)

    case Repo.update(changeset) do
      {:ok, detento} ->
        render(conn, "show.json", detento: detento)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Detinder.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    detento = Repo.get!(Detento, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(detento)

    send_resp(conn, :no_content, "")
  end
end
