class Animal < ApplicationRecord
  validates :nascimento, :cor, :tipo_pelo, :tamanho_pelo, :nome, :peso, :porte, :descricao, :status, presence: true
  validates :idade, numericality: { greater_than: 0, less_than_or_equal_to: 10_950 }
  has_and_belongs_to_many :favorito
  has_many_attached :midias
  scope :filter_by_cor, ->(cor) { where cor: cor }
  scope :filter_by_tipo_pelo, ->(tipo_pelo) { where tipo_pelo: tipo_pelo }
  scope :filter_by_tamanho_pelo, ->(tamanho_pelo) { where tamanho_pelo: tamanho_pelo }
  scope :filter_by_porte, ->(porte) { where porte: porte }
  scope :filter_by_idade_min, ->(idade_min) { where('nascimento <= ?', Date.today - idade_min.to_i.day) }
  scope :filter_by_idade_max, ->(idade_max) { where('nascimento >= ?', Date.today - idade_max.to_i.day) }
  scope :filter_by_search, ->(search) { where('nome LIKE :search  OR  descricao LIKE :search', search: "%#{search}%") }

  enum status: {
    disponivel: 0,
    indisponivel: 100
  }

  enum cor: {
    amarelo: 0,
    marrom: 1,
    branco: 2,
    preto: 3,
    cinzento: 4,
    dourado: 5,
    vermelho: 6,
    creme: 7,
    lilás: 8,
    bege: 9
  }

  enum tipo_pelo: {
    macio: 0,
    ondulado: 1,
    cerdoso: 2
  }

  enum tamanho_pelo: {
    curto: 0,
    comprido: 1
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

  def attach_midias(midias)
    midias.each do |midia|
      self.midias.attach(midia)
    end
  end
end
