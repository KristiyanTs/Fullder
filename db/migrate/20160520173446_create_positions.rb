class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true

      t.string :role
      t.text :description

      t.boolean :create_meal
      t.boolean :edit_menu
      t.boolean :create_position
      t.boolean :edit_position

      t.timestamps null: false
    end
  end
end
