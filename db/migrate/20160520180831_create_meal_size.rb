class CreateMealSize < ActiveRecord::Migration
  def change
    create_table :meal_sizes do |t|
      t.references :meal, index: true, foreign_key: true
      t.text :description

      t.string :name
      t.decimal :price, precision: 10, scale: 2
    end
  end
end
