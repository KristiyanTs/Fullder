# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  cart_id           :integer
#  meal_id           :integer
#  quantity          :integer
#  specifications    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  meal_size_id      :integer
#  supplementals_ids :integer
#  restaurant_id     :integer
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
