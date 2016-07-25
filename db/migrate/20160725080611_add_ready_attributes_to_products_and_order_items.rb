class AddReadyAttributesToProductsAndOrderItems < ActiveRecord::Migration
  def change
    add_column :products, :ready, :boolean, default: false
    add_column :products, :average_time, :datetime, default: DateTime.current
    add_column :order_items, :ready, :boolean, default: false
  end
end
