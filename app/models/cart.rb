# == Schema Information
#
# Table name: carts
#
#  id            :integer          not null, primary key
#  bill          :decimal(10, 2)
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Cart < ActiveRecord::Base
  has_many :orders, dependent: :destroy
end
