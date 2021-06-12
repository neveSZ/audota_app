# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :animal, foreign_key: true

      t.timestamps
    end
  end
end
