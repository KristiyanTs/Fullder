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
#  name              :string
#

class Category < ActiveRecord::Base
  belongs_to :menu
  has_many :meals, dependent: :destroy
  has_many :working_hours, dependent: :destroy
end
