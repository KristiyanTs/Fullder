# == Schema Information
#
# Table name: supplementals
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  meal_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :supplemental do
    name 'MyString'
    description 'MyText'
    price '9.99'
    meal nil
  end
end
