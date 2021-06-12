# frozen_string_literal: true

class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.date :birthday
      t.integer :color
      t.integer :fur_type
      t.string :name
      t.integer :weight
      t.integer :size
      t.text :description

      t.timestamps
    end
  end
end
