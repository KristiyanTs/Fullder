class AddReservationTableToleranceToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :reservation_time_tolerance, :integer
  end
end
