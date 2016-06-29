class AddOrderToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :order_id, :integer
  end
end
