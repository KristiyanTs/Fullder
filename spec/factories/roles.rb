# frozen_string_literal: true
# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_roles_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_a5d1cc5ecc  (restaurant_id => restaurants.id)
#

FactoryGirl.define do
  factory :role do
    name 'MyString'
  end
end
