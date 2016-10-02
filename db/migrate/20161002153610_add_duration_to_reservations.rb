class AddDurationToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :duration, :time
  end
end
