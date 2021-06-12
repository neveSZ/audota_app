# frozen_string_literal: true

class AnimalsController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[index show]

  def index
    @animals = Animal.where(status: :disponivel).where.not(id: current_favorites.animal.ids)
    filter_params(params).each do |key, value|
      @animals = @animals.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @current_favorites = current_favorites
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.status = 'disponivel'
    @animal.attach_medias(params[:animal][:medias]) if params[:animal][:medias].present?

    if @animal.save
      redirect_to @animal, notice: 'Animal cadastrado com sucesso'
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.attach_medias(params[:animal][:medias]) if params[:animal][:medias].present?

    if @animal.update(animal_params)
      redirect_to @animal
    else
      render :edit
    end
  end

  def filter_params(params)
    params.slice(:color, :fur_type, :fur_size, :size, :age_min, :age_max, :search)
  end

  def delete_media_attachment
    media = ActiveStorage::Attachment.find(params[:id])
    media.purge
    redirect_back(fallback_location: root_path)
  end

  private def animal_params
    animal_params = params.require(:animal).permit(:name, :weight, :description, :birthday, :color, :fur_type, :fur_size,
                                                   :size)
    animal_params[:color] = animal_params[:color].to_i
    animal_params[:fur_type] = animal_params[:fur_type].to_i
    animal_params[:fur_size] = animal_params[:fur_size].to_i
    animal_params[:size] = animal_params[:size].to_i
    animal_params
  end
end
