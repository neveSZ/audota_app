class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :endereco
      t.string :string
      t.integer :idade
      t.string :telefone

      t.timestamps
    end
  end
end
