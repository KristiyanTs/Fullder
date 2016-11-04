# == Schema Information
#
# Table name: overall_averages
#
#  id            :integer          not null, primary key
#  rateable_type :string
#  rateable_id   :integer
#  overall_avg   :float            not null
#  created_at    :datetime
#  updated_at    :datetime
#

class OverallAverage < ActiveRecord::Base
  belongs_to :rateable, :polymorphic => true
end

