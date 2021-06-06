class FavoritosController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[index create destroy]

  def index
    @animals = favoritos_atuais.animal.where(status: :disponivel)
  end

  def create
    favoritos_atuais.animal << Animal.find(params[:animal_id])
    redirect_to animals_path
  end

  def destroy
    favoritos_atuais.animal.delete(Animal.find(params[:animal_id]))
    redirect_to favoritos_path
  end
end
