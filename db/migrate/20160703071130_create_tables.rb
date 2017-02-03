# frozen_string_literal: true
class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number
      t.integer :capacity
      t.string :code,                   unique: true, null: false
      t.references :restaurant,         index: true, foreign_key: true
      t.references :user,               index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
