# frozen_string_literal: true
# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  order_id    :integer
#  size_id     :integer
#  unit_price  :decimal(, )
#  quantity    :integer
#  total_price :decimal(, )
#  demands     :string
#  received_at :datetime
#  ready_at    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_order_items_on_order_id    (order_id)
#  index_order_items_on_product_id  (product_id)
#  index_order_items_on_size_id     (size_id)
#
# Foreign Keys
#
#  fk_rails_28971b9eb6  (size_id => sizes.id)
#  fk_rails_e3cb28f071  (order_id => orders.id)
#  fk_rails_f1a29ddd47  (product_id => products.id)
#

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
