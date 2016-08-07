class AddRestaurantToImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :restaurant, foreign_key: true
  end
end
