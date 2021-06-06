class AnimalsController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[index show]

  def index
    @animals = Animal.where(status: :disponivel).where.not(id: favoritos_atuais.animal.ids)
  end

  def show
    @animal = Animal.find(params[:id])
    @favoritos_atuais = favoritos_atuais
  end
end
