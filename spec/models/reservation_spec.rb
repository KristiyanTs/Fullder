# == Schema Information
#
# Table name: reservations
#
#  id             :integer          not null, primary key
#  restaurant_id  :integer
#  user_id        :integer
#  table_id       :integer
#  from_time      :datetime
#  duration       :time
#  contact_number :string
#  contact_name   :string
#  seats          :integer
#  requirements   :string
#  confirmed      :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_reservations_on_restaurant_id  (restaurant_id)
#  index_reservations_on_table_id       (table_id)
#  index_reservations_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_0d6bc84231  (restaurant_id => restaurants.id)
#  fk_rails_23ce71128d  (table_id => tables.id)
#  fk_rails_48a92fce51  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "taken table" do
    it "can't save if the table is taken" do
      table = create(:table)
      reservation = build(:reservation, start_time: Time.now + 1.hour, end_time: Time.now + 4.hours)
      taken_reservation = create(:reservation)
      table.reservations << [taken_reservation, reservation]

      reservation.save
      expect(table.reservations.size).to be 1
    end
  end

  describe 'reservation' do
    it "can't have end_time before start_time" do
      reservation = build(:reservation,
                          start_time: Time.zone.now,
                          end_time: Time.zone.now - 1.hour)

      expect(reservation.save).to be_falsy
    end

    it "can't have end_time longer than 24 hours" do
      reservation = build(:reservation,
                          start_time: Time.zone.now,
                          end_time: Time.zone.now + 25.hours)

      expect(reservation.save).to be_falsy
    end
  end
end
