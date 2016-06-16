# == Schema Information
#
# Table name: categories
#
#  id                           :integer          not null, primary key
#  menu_id                      :integer
#  age_restriction              :boolean
#  available_all_day            :boolean
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  working_hour_id              :integer
#  name                         :string
#  category_avatar_file_name    :string
#  category_avatar_content_type :string
#  category_avatar_file_size    :integer
#  category_avatar_updated_at   :datetime
#

FactoryGirl.define do
  factory :category do
  end
end
