# == Schema Information
#
# Table name: meal_sizes
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  price       :decimal(, )
#  meal_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :meal_size do
    description "MyText"
    name "MyString"
    price "9.99"
    meal nil
  end
end
