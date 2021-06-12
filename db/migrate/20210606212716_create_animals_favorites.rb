# frozen_string_literal: true

class CreateAnimalsFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :animals_favorites do |t|
      t.references :animal, foreign_key: true
      t.references :favorite, foreign_key: true
    end
  end
end
