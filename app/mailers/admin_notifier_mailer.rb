class AdminNotifierMailer < ApplicationMailer
  default from: ENV['from_email']

  def send_new_order_email(order)
    @order = order
    mail(to: ENV['to_email'],
         subject: "Novo pedido de adoção do(a) #{order.animal.nome}")
  end
end
