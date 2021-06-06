class Animal < ApplicationRecord
  validates :nascimento, :cor, :tipo_pelo, :nome, :peso, :porte, :descricao, :status, presence: true
  has_and_belongs_to_many :favorito

  enum status: {
    disponivel: 0,
    indisponivel: 100
  }

  enum cor: {
    marrom: 0,
    branco: 1,
    preto: 2,
    azul: 3
  }

  enum tipo_pelo: {
    liso: 0,
    ondulado: 1
  }

  enum porte: {
    pequeno: 0,
    medio: 1,
    grande: 2
  }

  def idade
    # Retorna idade em dias
    (Date.today - nascimento).to_i
  end
end
