class CreateOrderOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :order_options do |t|
      t.references :order_item, foreign_key: true
      t.references :product_option, foreign_key: true

      t.timestamps
    end
  end
end
