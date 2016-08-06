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
    from = Date.today - (Date.today.wday - time.from_day ) % 7
    to   = from + (time.to_day - from.wday) % 7
    from = Time.new(from.year, from.month, from.day, time.from_time.hour, time.from_time.min, 0)
    to   = Time.new(to.year, to.month, to.day, time.to_time.hour, time.to_time.min, 0)

    Time.now.between?(from, to)
  end
end
