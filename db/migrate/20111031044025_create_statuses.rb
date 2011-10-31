class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :titulo
      t.string :descricao

      t.timestamps
    end
  end
end
