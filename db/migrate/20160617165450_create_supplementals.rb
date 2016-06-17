class CreateSupplementals < ActiveRecord::Migration
  def change
    create_table :supplementals do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :meal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
