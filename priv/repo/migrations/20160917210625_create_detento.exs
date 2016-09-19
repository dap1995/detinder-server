defmodule Detinder.Repo.Migrations.CreateDetento do
  use Ecto.Migration

  def change do
    create table(:detentos) do
      add :nome, :string
      add :rg, :string
      add :cpf, :string
      add :imagem, :string

      timestamps()
    end

  end
end
