# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111103062312) do

  create_table "chamados", :force => true do |t|
    t.string   "titulo"
    t.string   "descricao"
    t.integer  "id_status"
    t.integer  "id_usuario_criador"
    t.string   "id_usuario_responsavel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", :force => true do |t|
    t.string   "assunto"
    t.string   "texto"
    t.integer  "id_usuario"
    t.integer  "id_chamado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "titulo"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "senha_criptografada"
    t.boolean  "administrador"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end

end
