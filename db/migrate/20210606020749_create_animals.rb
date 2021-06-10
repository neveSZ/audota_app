# frozen_string_literal: true

class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.date :nascimento
      t.integer :cor
      t.integer :tipo_pelo
      t.string :nome
      t.integer :peso
      t.integer :porte
      t.text :descricao

      t.timestamps
    end
  end
end
