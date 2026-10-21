class CreatePedidos < ActiveRecord::Migration[8.0]
  def change
    create_table :pedidos do |t|
      t.string :cliente, null: false
      t.decimal :total, precision: 10, scale: 2, null: false
      t.timestamps
    end
  end
end
