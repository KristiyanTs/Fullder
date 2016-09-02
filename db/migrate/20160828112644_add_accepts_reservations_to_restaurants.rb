class AddAcceptsReservationsToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :accepts_reservations, :boolean
    add_column :restaurants, :accepts_deliveries, :boolean
  end
end
