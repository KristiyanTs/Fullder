# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  cart_id         :integer
#  meal_id         :integer
#  quantity        :integer
#  specifications  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  meal_size_id    :integer
#  supplemental_id :integer
#  restaurant_id   :integer
#

class Order < ActiveRecord::Base
  belongs_to :cart

  has_one :meal
  has_many :supplementals

  accepts_nested_attributes_for :meal
  accepts_nested_attributes_for :supplementals
end
