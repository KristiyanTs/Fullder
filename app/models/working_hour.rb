# == Schema Information
#
# Table name: working_hours
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  starting_hour :datetime
#  ending_hour   :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WorkingHour < ActiveRecord::Base
end
