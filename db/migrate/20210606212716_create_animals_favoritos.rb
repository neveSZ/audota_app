# frozen_string_literal: true

class CreateAnimalsFavoritos < ActiveRecord::Migration[6.1]
  def change
    create_table :animals_favoritos do |t|
      t.references :animal, foreign_key: true
      t.references :favorito, foreign_key: true
    end
  end
end
