class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :senha_criptografada
      t.boolean :administrador

      t.timestamps
    end
  end
end
