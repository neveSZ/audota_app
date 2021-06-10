# frozen_string_literal: true

class AddTamanhoPeloToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :tamanho_pelo, :integer
  end
end
