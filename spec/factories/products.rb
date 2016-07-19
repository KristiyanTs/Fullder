# frozen_string_literal: true
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
# Indexes
#
#  index_products_on_category_id    (category_id)
#  index_products_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_009fa2d872  (restaurant_id => restaurants.id)
#  fk_rails_fb915499a4  (category_id => categories.id)
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
