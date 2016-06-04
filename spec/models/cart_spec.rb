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

require 'rails_helper'

RSpec.describe Cart, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
