# frozen_string_literal: true
class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.references :restaurant,            index: true, foreign_key: true
      t.references :category,              index: true, foreign_key: true
      t.string :name
      t.string :short_description
      t.text :description
      t.decimal :price                  
      t.boolean :active
      t.integer :average_prepare_time
      t.boolean :ready

      t.timestamps
    end
    Product.create_translation_table!      name: :string, short_description: :string, description: :text
  end

  def down
    drop_table :products
    Product.drop_translation_table!
  end
end
