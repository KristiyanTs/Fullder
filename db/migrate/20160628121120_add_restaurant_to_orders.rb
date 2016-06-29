class AddRestaurantToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :restaurant_id, :integer
  end
end
