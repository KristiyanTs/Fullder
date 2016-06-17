class CreateMealSizes < ActiveRecord::Migration
  def change
    create_table :meal_sizes do |t|
      t.text :description
      t.string :name
      t.decimal :price
      t.references :meal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
