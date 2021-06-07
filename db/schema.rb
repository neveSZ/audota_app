# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_07_103032) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "animals", force: :cascade do |t|
    t.date "nascimento"
    t.integer "cor"
    t.integer "tipo_pelo"
    t.string "nome"
    t.integer "peso"
    t.integer "porte"
    t.text "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.integer "tamanho_pelo"
  end

  create_table "animals_favoritos", force: :cascade do |t|
    t.integer "animal_id"
    t.integer "favorito_id"
    t.index ["animal_id"], name: "index_animals_favoritos_on_animal_id"
    t.index ["favorito_id"], name: "index_animals_favoritos_on_favorito_id"
  end

  create_table "favoritos", force: :cascade do |t|
    t.integer "animal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_favoritos_on_animal_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.integer "status"
    t.date "efetivacao_data"
    t.string "nome"
    t.string "cpf"
    t.string "email"
    t.string "endereco"
    t.integer "idade"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_orders_on_animal_id"
  end

  add_foreign_key "animals_favoritos", "animals"
  add_foreign_key "animals_favoritos", "favoritos"
  add_foreign_key "favoritos", "animals"
  add_foreign_key "orders", "animals"
end
