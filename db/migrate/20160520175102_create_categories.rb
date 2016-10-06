# frozen_string_literal: true
class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.references :restaurant,        index: true, foreign_key: true
      t.references :supercategory,     index: true
      t.string :name
      t.boolean :age_restriction
      t.boolean :available_all_day

      t.timestamps null: false
    end
    Category.create_translation_table! name: :string
  end

  def down
    drop_table :categories
    Category.drop_translation_table!
  end
end
