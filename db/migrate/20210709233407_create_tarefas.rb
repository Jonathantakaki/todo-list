class CreateTarefas < ActiveRecord::Migration[6.1]
  def change
    create_table :tarefas do |t|
      t.string :nome, limit: 200
      t.datetime :concluido
      t.datetime :removido
      t.references :grupo, null: true, foreign_key: true

      t.timestamps
    end
  end
end
