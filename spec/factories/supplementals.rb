# == Schema Information
#
# Table name: supplementals
#
#  id          :integer          not null, primary key
#  meal_id     :integer
#  name        :string
#  description :text
#  price       :decimal(10, 2)
#

FactoryGirl.define do
  factory :supplemental do
    name 'MyString'
    description 'MyText'
    price '9.99'
    meal nil
  end
end
