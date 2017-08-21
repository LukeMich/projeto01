class CreateVisitantes < ActiveRecord::Migration
  def change
    create_table :visitantes do |t|
      t.string :nome
      t.string :email
      t.string :telefone

      t.timestamps null: false
    end
  end
end
