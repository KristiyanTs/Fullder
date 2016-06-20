# == Schema Information
#
# Table name: meals
#
#  id                       :integer          not null, primary key
#  name                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  category_id              :integer
#  meal_avatar_file_name    :string
#  meal_avatar_content_type :string
#  meal_avatar_file_size    :integer
#  meal_avatar_updated_at   :datetime
#  restaurant_id            :integer
#  menu_id                  :integer
#  short_description        :string
#

FactoryGirl.define do
  factory :meal do
  end
end
