class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.string :titulo
      t.string :descricao
      t.integer :id_status
      t.integer :id_usuario_criador
      t.string :id_usuario_responsavel

      t.timestamps
    end
  end
end
