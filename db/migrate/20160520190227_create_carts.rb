class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :bill, precision: 10, scale: 2

      t.references :restaurant, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
