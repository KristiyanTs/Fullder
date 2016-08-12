# frozen_string_literal: true
class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
