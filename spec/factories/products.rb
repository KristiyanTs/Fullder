# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  restaurant_id       :integer
#  category_id         :integer
#  name                :string
#  short_description   :string
#  description         :text
#  price               :decimal(, )
#  active              :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

FactoryGirl.define do
  factory :product do
    name 'MyString'
    price '9.99'
    active false
    description 'MyText'
    short_description 'MyString'
  end
end
