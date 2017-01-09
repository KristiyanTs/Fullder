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
  has_many :reservation_tables, dependent: :destroy
  has_many :reservations, through: :reservation_tables
  
  validates :number, uniqueness: { scope: :restaurant_id }
  validates :number, presence: true
  validates :capacity, presence: true

  scope :search, lambda { |keyword|
    unless keyword.blank?
      where(capacity: keyword) if keyword
    end
  }

  def occupied?(st_time, duration, res_id=0)
    fin_time = st_time + duration.seconds_since_midnight.seconds
    reservations.any? { |res| res.confirmed && (st_time .. fin_time).overlaps?(res.start_time .. res.end_time) }
  end

  def table_info
    "№#{number} - for #{capacity}"
  end
end
