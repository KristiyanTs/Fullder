class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.string :name
      t.boolean :age_restriction
      t.boolean :available_all_day

      t.timestamps null: false
    end
  end
end
