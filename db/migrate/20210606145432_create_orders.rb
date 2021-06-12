# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :animal, null: false, foreign_key: true
      t.integer :status
      t.date :conclusion_date
      t.string :name
      t.string :cpf
      t.string :email
      t.string :address
      t.integer :age
      t.string :telephone

      t.timestamps
    end
  end
end
