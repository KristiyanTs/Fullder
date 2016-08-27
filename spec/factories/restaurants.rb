# frozen_string_literal: true
# == Schema Information
#
# Table name: restaurants
#
#  id                             :integer          not null, primary key
#  name                           :string
#  address                        :string
#  description                    :text
#  phone_number                   :string
#  country                        :string           default("en-GB")
#  latitude                       :float
#  longitude                      :float
#  sells_online                   :boolean
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  restaurant_avatar_file_name    :string
#  restaurant_avatar_content_type :string
#  restaurant_avatar_file_size    :integer
#  restaurant_avatar_updated_at   :datetime
#  slug                           :string
#
# Indexes
#
#  index_restaurants_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :restaurant do
  end
end
