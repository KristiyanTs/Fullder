# frozen_string_literal: true
class CreateWorkingTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :working_times do |t|
      t.time :from_time,        null: false
      t.time :to_time
      t.integer :from_day,      null: false
      t.integer :to_day,        null: false
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
