# frozen_string_literal: true

class FavoritesController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[index create destroy]

  def index
    @animals = current_favorites.animal.where(status: :disponivel)
    filter_params(params).each do |key, value|
      @animals = @animals.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  def create
    current_favorites.animal << Animal.find(params[:animal_id])
    redirect_to animals_path
  end

  def destroy
    current_favorites.animal.delete(Animal.find(params[:animal_id]))
    redirect_to favorites_path
  end

  def filter_params(params)
    params.slice(:color, :fur_type, :fur_size, :size, :age_min, :age_max, :search)
  end
end
