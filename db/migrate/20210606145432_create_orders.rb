# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :animal, null: false, foreign_key: true
      t.integer :status
      t.date :efetivacao_data
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :endereco
      t.integer :idade
      t.string :telefone

      t.timestamps
    end
  end
end
