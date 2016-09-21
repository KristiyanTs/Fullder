# frozen_string_literal: true
class CreateRestaurants < ActiveRecord::Migration
  def up
    create_table :restaurants do |t|
      t.string :name,                    null: false
      t.string :address,                 null: false
      t.string :wifipassword
      t.text :description
      t.string :phone_number
      t.string :country,                 default: 'en-GB'
      t.float :latitude
      t.float :longitude
      t.boolean :sells_online

      t.timestamps                       null: false
    end
    Restaurant.create_translation_table! description: :text
  end

  def down
    drop_table :restaurants
    Restaurant.drop_translation_table!
  end
end
