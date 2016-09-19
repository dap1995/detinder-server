defmodule Detinder.Detento do
  use Detinder.Web, :model

  schema "detentos" do
    field :nome, :string
    field :rg, :string
    field :cpf, :string
    field :imagem, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nome, :rg, :cpf, :imagem])
    |> validate_required([:nome, :rg, :cpf, :imagem])
  end
end
