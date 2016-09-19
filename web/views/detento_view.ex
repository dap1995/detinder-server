defmodule Detinder.DetentoView do
  use Detinder.Web, :view

  def render("index.json", %{detentos: detentos}) do
    %{data: render_many(detentos, Detinder.DetentoView, "detento.json")}
  end

  def render("show.json", %{detento: detento}) do
    %{data: render_one(detento, Detinder.DetentoView, "detento.json")}
  end

  def render("detento.json", %{detento: detento}) do
    %{id: detento.id,
      nome: detento.nome,
      rg: detento.rg,
      cpf: detento.cpf,
      imagem: detento.imagem}
  end
end
