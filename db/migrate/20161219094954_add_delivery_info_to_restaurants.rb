class AddDeliveryInfoToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :delivery_time, :integer
    add_column :restaurants, :delivery_cost, :decimal
    add_column :restaurants, :min_delivery_price, :decimal
    add_column :restaurants, :delivery_radius, :integer
  end
end
