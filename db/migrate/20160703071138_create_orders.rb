class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :order_status, index: true, foreign_key: true
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :shipping
      t.decimal :tip
      t.decimal :total

      t.timestamps null: false
    end
  end
end
