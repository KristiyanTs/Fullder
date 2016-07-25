class AddReadyAttributesToProductsAndOrderItems < ActiveRecord::Migration
  def change
    add_column :products, :ready, :boolean
    add_column :products, :average_time, :datetime
    add_column :order_items, :ready, :boolean
  end
end
