# frozen_string_literal: true

class AddTamanhoPeloToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :fur_size, :integer
  end
end
