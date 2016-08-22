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

class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  belongs_to :table

  validate :user_confirmed?
  # validate :table_not_occupied

  def user_confirmed?
    errors.add(:user, 'has not confirmed an email.') if (user && !user.confirmed?) 
  end

  def table_not_occupied?
    errors.add(:table_id, "has another reservation then.") if table&.any()
  end

  scope :search, lambda { |keyword|
    where(seats: keyword) if keyword
  }
end
