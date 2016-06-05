# == Schema Information
#
# Table name: meals
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Meal < ActiveRecord::Base
  belongs_to :category
  has_many :meal_sizes, dependent: :destroy
  has_many :supplementals, dependent: :destroy

  has_many :orders
end
