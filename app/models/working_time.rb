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
    return false unless valid_working_hours?
    from = Time.zone.today - (Time.zone.today.wday - from_day) % 7
    to = from + (to_day - from.wday) % 7
    from = Time.zone.local(from.year, from.month,
                         from.day, from_time.hour, from_time.min, 0)
    to = Time.zone.local(to.year, to.month,
                       to.day, to_time.hour, to_time.min, 0)

    Time.zone.now.between?(from, to)
  end

  def valid_working_hours?
    from_day && from_time && to_day && to_time
  end
end
