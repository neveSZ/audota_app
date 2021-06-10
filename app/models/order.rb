class Order < ApplicationRecord
  belongs_to :animal
  after_create :set_pendente
  validates :nome, :cpf, :email, :endereco, :idade, :telefone, :animal, :status, presence: true
  validates :cpf, cpf: true
  validates :email, email: { mode: :strict, require_fqdn: true }
  validates :telefone, telephone_number: { country: :br, types: %i[fixed_line mobile] }
  validates :idade, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 100 }

  enum status: {
    pendente: 0,
    concluido: 100,
    cancelado: 200
  }

  def set_pendente
    if animal.disponivel?
      animal.indisponivel!
      self.status = 'pendente'
    end
  end

  def set_cancelado
    if animal.indisponivel? && pendente?
      animal.disponivel!
      cancelado!
    end
  end

  def set_concluido
    if pendente?
      concluido!
      self.efetivacao_data = Date.today
      save
    end
  end
end
