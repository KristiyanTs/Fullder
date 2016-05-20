class CreateWorkingHours < ActiveRecord::Migration
  def change
    create_table :working_hours do |t|
      t.references :restaurant, index: true, foreign_key: true

      t.datetime :starting_hour
      t.datetime :ending_hour

      t.timestamps null: false
    end
  end
end
