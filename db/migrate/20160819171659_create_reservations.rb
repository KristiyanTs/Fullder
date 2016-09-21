class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :restaurant,        null: false, foreign_key: true
      t.references :user,              foreign_key: true
      t.references :table,             foreign_key: true
      t.datetime :start_time,          null: false
      t.datetime :end_time
      t.string :contact_number
      t.string :contact_name,          null: false
      t.integer :seats
      t.string :requirements
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
