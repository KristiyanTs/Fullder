class AddShortDescriptionToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :short_description, :string
  end
end
