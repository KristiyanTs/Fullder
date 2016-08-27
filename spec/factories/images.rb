# frozen_string_literal: true
# == Schema Information
#
# Table name: images
#
#  id               :integer          not null, primary key
#  restaurant_id    :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pic_file_name    :string
#  pic_content_type :string
#  pic_file_size    :integer
#  pic_updated_at   :datetime
#
# Indexes
#
#  index_images_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_2b7d98327c  (restaurant_id => restaurants.id)
#

FactoryGirl.define do
  factory :image do
  end
end
