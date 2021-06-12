# frozen_string_literal: true

class Favorite < ApplicationRecord
  has_and_belongs_to_many :animal
end
