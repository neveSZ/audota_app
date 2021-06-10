# frozen_string_literal: true

class FavoritosController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[index create destroy]

  def index
    @animals = favoritos_atuais.animal.where(status: :disponivel)
    filter_params(params).each do |key, value|
      @animals = @animals.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  def create
    favoritos_atuais.animal << Animal.find(params[:animal_id])
    redirect_to animals_path
  end

  def destroy
    favoritos_atuais.animal.delete(Animal.find(params[:animal_id]))
    redirect_to favoritos_path
  end

  def filter_params(params)
    params.slice(:cor, :tipo_pelo, :tamanho_pelo, :porte, :idade_min, :idade_max, :search)
  end
end
