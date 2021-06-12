# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :animal
  validates :name, :cpf, :email, :address, :age, :telephone, :animal, presence: true
  validates :cpf, cpf: true
  validates :email, email: { mode: :strict, require_fqdn: true }
  validates :telephone, telephone_number: { country: :br, types: %i[fixed_line mobile] }
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 100 }

  enum status: {
    pendente: 0,
    concluido: 100,
    cancelado: 200
  }

  def set_pendente
    if animal.disponivel?
      animal.indisponivel!
      pendente!
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
      self.conclusion_date = Date.today
      save
    end
  end
end
