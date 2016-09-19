defmodule Detinder.DetentoTest do
  use Detinder.ModelCase

  alias Detinder.Detento

  @valid_attrs %{cpf: "some content", imagem: "some content", nome: "some content", rg: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Detento.changeset(%Detento{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Detento.changeset(%Detento{}, @invalid_attrs)
    refute changeset.valid?
  end
end
