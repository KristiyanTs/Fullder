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
#  table_number  :integer
#  menu_id       :integer
#

class Cart < ActiveRecord::Base
  before_save :default_values

  belongs_to :user
  belongs_to :restaurant

  has_many :orders, dependent: :destroy

  def default_values
    self.bill ||= 0
  end
end
