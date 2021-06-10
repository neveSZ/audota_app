# frozen_string_literal: true

class CreateFavoritos < ActiveRecord::Migration[6.1]
  def change
    create_table :favoritos do |t|
      t.references :animal, foreign_key: true

      t.timestamps
    end
  end
end
