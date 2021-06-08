class Order < ApplicationRecord
  belongs_to :animal
  after_create :set_pendente
  validates :nome, :cpf, :email, :endereco, :idade, :telefone, :animal, :status, presence: true
  validates :cpf, cpf: true
  validates :email, email: { mode: :strict, require_fqdn: true }
  validates :telefone, telephone_number: { country: :br, types: %i[fixed_line mobile] }
  validates :idade, numericality: { greater_than_or_equal_to: 18 }

  enum status: {
    pendente: 0,
    concluido: 100,
    cancelado: 200
  }

  def set_pendente
    animal.indisponivel!
  end

  def set_cancelado
    animal.disponivel!
    cancelado!
  end

  def set_concluido
    animal.indisponivel!
    concluido!
    self.efetivacao_data = Date.today
    save
  end
end
