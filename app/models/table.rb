# frozen_string_literal: true
# == Schema Information
#
# Table name: tables
#
#  id            :integer          not null, primary key
#  number        :integer
#  capacity      :integer
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_tables_on_restaurant_id  (restaurant_id)
#  index_tables_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_0700cfe41e  (restaurant_id => restaurants.id)
#  fk_rails_7b7f01e20c  (user_id => users.id)
#

class Table < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  has_many :orders
  has_many :reservations

  validates :number, uniqueness: { scope: :restaurant_id }
  validates :number, presence: true
  validates :capacity, presence: true

  scope :search, lambda { |keyword|
    unless keyword.blank?
      where(capacity: keyword) if keyword
    end
  }

  def occupied?(st_time, duration)
    tolerance = restaurant.reservation_time_tolerance || 0
    res_end_time = st_time + duration.seconds_since_midnight.seconds + tolerance.minutes

    u = reservations.select{ |res| st_time.between?(res.start_time, res.start_time + res.duration.seconds_since_midnight.seconds) || res_end_time.between?(res.start_time, res.start_time + res.duration.seconds_since_midnight.seconds)}
    
    return (u.length > 0 ? true : false)
  end
end
