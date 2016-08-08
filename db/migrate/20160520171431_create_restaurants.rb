class CreateRestaurants < ActiveRecord::Migration
  def up
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :phone_number

      t.timestamps null: false
    end
    Restaurant.create_translation_table! description: :text
  end

  def down
    drop_table :restaurants
    Restaurant.drop_translation_table!
  end
end
