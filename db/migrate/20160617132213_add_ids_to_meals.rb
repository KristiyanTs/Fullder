class AddIdsToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :restaurant_id, :integer
    add_column :meals, :menu_id, :integer
  end
end
