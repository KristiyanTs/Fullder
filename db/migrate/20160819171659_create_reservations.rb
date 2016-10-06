class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :restaurant,        foreign_key: true
      t.references :user,              foreign_key: true
      t.references :table,             foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :contact_number
      t.string :contact_name
      t.integer :seats
      t.string :requirements
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
