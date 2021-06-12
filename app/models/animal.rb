# frozen_string_literal: true

class Animal < ApplicationRecord
  validates :birthday, :color, :fur_type, :fur_size, :name, :weight, :size, :description, :status, presence: true
  validates :age, numericality: { greater_than: 0, less_than_or_equal_to: 10_950 }
  has_and_belongs_to_many :favorite
  has_many_attached :medias
  scope :filter_by_cor, ->(cor) { where color: cor }
  scope :filter_by_fur_type, ->(fur_type) { where fur_type: fur_type }
  scope :filter_by_fur_size, ->(fur_size) { where fur_size: fur_size }
  scope :filter_by_size, ->(size) { where size: size }
  scope :filter_by_age_min, ->(age_min) { where('birthday <= ?', Date.today - age_min.to_i.day) }
  scope :filter_by_age_max, ->(age_max) { where('birthday >= ?', Date.today - age_max.to_i.day) }
  scope :filter_by_search, lambda { |search|
                             where('name LIKE :search  OR  description LIKE :search', search: "%#{search}%")
                           }

  enum status: {
    disponivel: 0,
    indisponivel: 100
  }

  enum color: {
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

  enum fur_type: {
    macio: 0,
    ondulado: 1,
    cerdoso: 2
  }

  enum fur_size: {
    curto: 0,
    comprido: 1
  }

  enum size: {
    pequeno: 0,
    medio: 1,
    grande: 2
  }

  def age
    (Date.today - birthday).to_i
  end

  def attach_medias(medias)
    medias.each do |media|
      self.medias.attach(media)
    end
  end
end
