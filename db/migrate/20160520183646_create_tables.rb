class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number
      t.integer :capacity

      t.text :description
      t.boolean :available
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
