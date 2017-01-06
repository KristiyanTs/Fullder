class CreateReservationTables < ActiveRecord::Migration[5.0]
  def change
    create_table :reservation_tables do |t|
      t.references :restaurant,         index: true, foreign_key: true
      t.references :reservation,         index: true, foreign_key: true
      t.references :table,         index: true, foreign_key: true
      t.timestamps
    end
  end
end
