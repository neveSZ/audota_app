class AnimalsController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[index show search]

  def index
    @animals = Animal.where(status: :disponivel).where.not(id: favoritos_atuais.animal.ids)
  end

  def show
    @animal = Animal.find(params[:id])
    @favoritos_atuais = favoritos_atuais
  end

  def search
    @animals = Animal.where(status: :disponivel).where('animals.nome LIKE :search  OR  animals.descricao LIKE :search',
                                                       search: "%#{params[:animal_search]}%")
    render :index
  end
end
