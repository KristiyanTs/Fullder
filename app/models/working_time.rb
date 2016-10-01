# frozen_string_literal: true
# == Schema Information
#
# Table name: working_times
#
#  id            :integer          not null, primary key
#  from_time     :time
#  to_time       :time
#  from_day      :integer
#  to_day        :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_working_times_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_da83beb9c6  (restaurant_id => restaurants.id)
#

class WorkingTime < ApplicationRecord
  belongs_to :restaurant

  def active_now?
    if valid_working_hours?
      from = Date.today - (Date.today.wday - from_day) % 7
      to   = from + (to_day - from.wday) % 7
      from = Time.new(from.year, from.month, from.day, from_time.hour, from_time.min, 0)
      to   = Time.new(to.year, to.month, to.day, to_time.hour, to_time.min, 0)

      Time.now.between?(from, to)
    else
      false
    end
  end

  def closest_from_time
    from = Date.today - (Date.today.wday - from_day) % 7
    from = Time.new(from.year, from.month, from.day, from_time.hour, from_time.min, 0)
  end

  def valid_working_hours?
    from_day && from_time && to_day && to_time
  end
end
