class AnimalsController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[index show]

  def index
    @animals = Animal.where(status: :disponivel).where.not(id: favoritos_atuais.animal.ids)
    filter_params(params).each do |key, value|
      @animals = @animals.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @favoritos_atuais = favoritos_atuais
  end

  def filter_params(params)
    params.slice(:cor, :tipo_pelo, :tamanho_pelo, :porte, :idade_min, :idade_max, :search)
  end
end
