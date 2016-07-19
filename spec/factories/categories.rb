# frozen_string_literal: true
# == Schema Information
#
# Table name: categories
#
#  id                  :integer          not null, primary key
#  restaurant_id       :integer
#  name                :string
#  age_restriction     :boolean
#  available_all_day   :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#
# Indexes
#
#  index_categories_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_ec0260600b  (restaurant_id => restaurants.id)
#

FactoryGirl.define do
  factory :category do
  end
end
