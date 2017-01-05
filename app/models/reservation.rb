# == Schema Information
#
# Table name: reservations
#
#  id             :integer          not null, primary key
#  restaurant_id  :integer
#  user_id        :integer
#  table_id       :integer
#  start_time     :datetime
#  end_time       :datetime
#  contact_number :string
#  contact_name   :string
#  seats          :integer
#  requirements   :string
#  confirmed      :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  duration       :time
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

  validates :contact_name, presence: true
  validates :contact_number, presence: true
  validates :start_time, presence: true
  validates :seats, presence: true
  validate :user_confirmed
  validate :reservation_overlaps 

  before_validation :calc_end_time

  scope :search, lambda { |keyword|
    unless keyword.blank?
      where(seats: keyword)
    end
  }

  private

  def user_confirmed
    errors.add(:user, 'has not confirmed an email.') if user && !user.confirmed?
  end

  def reservation_overlaps
    errors.add(:table, 'Table taken.') if duration.present? && table.occupied?(start_time, duration, id)
  end

  def calc_end_time
    self.end_time = (start_time + duration.seconds_since_midnight.seconds) if duration.present?
  end

end
