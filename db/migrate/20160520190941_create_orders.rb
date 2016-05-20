class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :meal, index: true, foreign_key: true
      
      t.integer :quantity
      t.string :specifications

      t.timestamps null: false
    end
  end
end
