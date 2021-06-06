class AnimalsController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[index show]

  def index
    @animals = Animal.where(status: :disponivel)
  end

  def show
    @animal = Animal.find(params[:id])
  end
end
