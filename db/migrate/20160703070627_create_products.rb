# frozen_string_literal: true
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.string :short_description
      t.text :description
      t.decimal :price
      t.boolean :active

      t.timestamps null: false
    end
  end
end
