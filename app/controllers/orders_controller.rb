class OrdersController < ApplicationController
  skip_before_action :authenticate_admin!, only: %i[new create]
  def new
    @animal = Animal.find(params.require(:animal_id))
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.set_pendente
    if @order.save
      AdminNotifierMailer.send_new_order_email(@order).deliver
      redirect_to animals_path, notice: 'Adoção reservada com sucesso! Vamos entrar em contato em breve'
    else
      @animal = @order.animal
      if @animal.indisponivel?
        redirect_to animals_path, notice: 'Animal indisponivel'
      else
        render :new, animal_id: @animal.id
      end
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def cancelar
    @order = Order.find(params[:id])
    @order.set_cancelado
    render :show
  end

  def concluir
    @order = Order.find(params[:id])
    @order.set_concluido
    render :show
  end

  private def order_params
    params.require(:order).permit(:nome, :cpf, :email, :endereco, :idade, :telefone, :animal_id)
  end
end
