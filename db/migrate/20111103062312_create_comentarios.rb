class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :assunto
      t.string :texto
      t.integer :id_usuario
      t.integer :id_chamado

      t.timestamps
    end
  end
end
