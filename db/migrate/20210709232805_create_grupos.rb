class CreateGrupos < ActiveRecord::Migration[6.1]
  def change
    create_table :grupos do |t|
      t.string :nome, limit: 50
      t.datetime :removido

      t.timestamps
    end
  end
end
