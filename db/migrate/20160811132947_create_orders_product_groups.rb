class CreateOrdersProductGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_product_groups do |t|
      t.references :order_item, foreign_key: true
      t.references :product_option_group, foreign_key: true

      t.timestamps
    end
  end
end
