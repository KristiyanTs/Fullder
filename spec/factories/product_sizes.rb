# == Schema Information
#
# Table name: product_sizes
#
#  id                :integer          not null, primary key
#  product_id        :integer
#  name              :string
#  price             :decimal(, )
#  short_description :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :product_size do
    name "MyString"
    product nil
    price "9.99"
    short_description "MyString"
  end
end
