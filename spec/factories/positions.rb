# == Schema Information
#
# Table name: positions
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  role_id       :integer
#  restaurant_id :integer
#

FactoryGirl.define do
  factory :position do
    
  end
end
