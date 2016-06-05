# == Schema Information
#
# Table name: categories
#
#  id                :integer          not null, primary key
#  menu_id           :integer
#  age_restriction   :boolean
#  available_all_day :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  working_hour_id   :integer
#

FactoryGirl.define do
  factory :category do
  end
end
