# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  cart_id        :integer
#  meal_id        :integer
#  quantity       :integer
#  specifications :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :meal
  belongs_to :cart
end
