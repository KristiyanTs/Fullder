class AddMealSizeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :meal_size_id, :integer
  end
end
