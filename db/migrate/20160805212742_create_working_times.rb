class CreateWorkingTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :working_times do |t|
      t.time :from_time
      t.time :to_time
      t.integer :from_day
      t.integer :to_day
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
