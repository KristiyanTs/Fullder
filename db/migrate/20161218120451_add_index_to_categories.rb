class AddIndexToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :index, :integer
  end
end
