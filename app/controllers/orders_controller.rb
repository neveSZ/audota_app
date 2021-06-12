# frozen_string_literal: true

class OrdersController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[new create]
  def new
    @animal = Animal.find(params.require(:animal_id))
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.animal.indisponivel?
      redirect_to animals_path, notice: 'Desculpe, mas este animal não está disponivel'
    elsif @order.save
      @order.set_pendente
      AdminNotifierMailer.send_new_order_email(@order).deliver
      redirect_to animals_path, notice: 'Adoção reservada com sucesso! Vamos entrar em contato em breve'
    else
      @animal = @order.animal
      render :new, animal_id: @animal.id
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def cancel
    @order = Order.find(params[:id])
    @order.set_cancelado
    render :show
  end

  def conclude
    @order = Order.find(params[:id])
    @order.set_concluido
    render :show
  end

  private def order_params
    params.require(:order).permit(:name, :cpf, :email, :address, :age, :telephone, :animal_id)
  end
end
