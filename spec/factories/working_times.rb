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

FactoryGirl.define do
  factory :working_time do
    from_time '2016-08-06 00:27:43'
    to_time '2016-08-06 00:27:43'
    from_day 1
    to_day 1
    restaurant nil
  end
end
