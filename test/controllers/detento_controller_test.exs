defmodule Detinder.DetentoControllerTest do
  use Detinder.ConnCase

  alias Detinder.Detento
  @valid_attrs %{cpf: "some content", imagem: "some content", nome: "some content", rg: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, detento_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    detento = Repo.insert! %Detento{}
    conn = get conn, detento_path(conn, :show, detento)
    assert json_response(conn, 200)["data"] == %{"id" => detento.id,
      "nome" => detento.nome,
      "rg" => detento.rg,
      "cpf" => detento.cpf,
      "imagem" => detento.imagem}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, detento_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, detento_path(conn, :create), detento: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Detento, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, detento_path(conn, :create), detento: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    detento = Repo.insert! %Detento{}
    conn = put conn, detento_path(conn, :update, detento), detento: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Detento, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    detento = Repo.insert! %Detento{}
    conn = put conn, detento_path(conn, :update, detento), detento: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    detento = Repo.insert! %Detento{}
    conn = delete conn, detento_path(conn, :delete, detento)
    assert response(conn, 204)
    refute Repo.get(Detento, detento.id)
  end
end
