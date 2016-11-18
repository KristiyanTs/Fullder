class AddInformationToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :avg_meal_price, :decimal
    add_column :restaurants, :staff_count, :integer
    add_column :restaurants, :facebook_link, :string
    add_column :restaurants, :twitter_link, :string
    add_column :restaurants, :available_payment, :string
  end
end
