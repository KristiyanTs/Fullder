# frozen_string_literal: true
class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.references :size, index: true, foreign_key: true
      t.decimal :unit_price
      t.integer :quantity
      t.decimal :total_price
      t.string :demands
      t.boolean :payed, default: false
      t.boolean :ready, default: false
      t.datetime :received_at
      t.datetime :ready_at

      t.timestamps null: false
    end
  end
end
