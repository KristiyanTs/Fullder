# frozen_string_literal: true
class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
