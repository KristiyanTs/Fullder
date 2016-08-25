# frozen_string_literal: true
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :order_status, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :table, index: true, foreign_key: true
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :shipping
      t.decimal :tip
      t.decimal :total
      t.integer :table_number
      t.string :address

      t.timestamps null: false
    end
  end
end
