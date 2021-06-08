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

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.status = 'disponivel'
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
    if @animal.update(animal_params)
      redirect_to @animal
    else
      render :edit
    end
  end

  def filter_params(params)
    params.slice(:cor, :tipo_pelo, :tamanho_pelo, :porte, :idade_min, :idade_max, :search)
  end

  private def animal_params
    animal_params = params.require(:animal).permit(:nome, :peso, :descricao, :nascimento, :cor, :tipo_pelo, :tamanho_pelo,
                                                   :porte)
    animal_params[:cor] = animal_params[:cor].to_i
    animal_params[:tipo_pelo] = animal_params[:tipo_pelo].to_i
    animal_params[:tamanho_pelo] = animal_params[:tamanho_pelo].to_i
    animal_params[:porte] = animal_params[:porte].to_i
    animal_params
  end
end
