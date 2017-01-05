# == Schema Information
#
# Table name: reservation_tables
#
#  id             :integer          not null, primary key
#  restaurant_id  :integer
#  reservation_id :integer
#  table_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_reservation_tables_on_reservation_id  (reservation_id)
#  index_reservation_tables_on_restaurant_id   (restaurant_id)
#  index_reservation_tables_on_table_id        (table_id)
#
# Foreign Keys
#
#  fk_rails_067f74749d  (table_id => tables.id)
#  fk_rails_25df6ce830  (reservation_id => reservations.id)
#  fk_rails_8fd7e5128d  (restaurant_id => restaurants.id)
#

class ReservationTable < ApplicationRecord
  belongs_to :reservation
  belongs_to :table
  belongs_to :restaurant
end
