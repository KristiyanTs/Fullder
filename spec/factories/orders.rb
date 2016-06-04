# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  cart_id        :integer
#  meal_id        :integer
#  quantity       :integer
#  specifications :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :order do
    
  end
end
