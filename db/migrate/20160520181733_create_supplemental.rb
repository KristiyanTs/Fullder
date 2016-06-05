class CreateSupplemental < ActiveRecord::Migration
  def change
    create_table :supplementals do |t|
      t.references :meal, index: true, foreign_key: true

      t.string :name
      t.text :description

      t.decimal :price, precision: 10, scale: 2
    end
  end
end
