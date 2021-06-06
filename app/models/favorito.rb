class Favorito < ApplicationRecord
  has_and_belongs_to_many :animal
end
