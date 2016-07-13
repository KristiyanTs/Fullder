# == Schema Information
#
# Table name: order_items
#
#  id              :integer          not null, primary key
#  product_id      :integer
#  order_id        :integer
#  unit_price      :decimal(, )
#  quantity        :integer
#  total_price     :decimal(, )
#  choices         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_size_id :integer
#
# Indexes
#
#  index_order_items_on_order_id         (order_id)
#  index_order_items_on_product_id       (product_id)
#  index_order_items_on_product_size_id  (product_size_id)
#
# Foreign Keys
#
#  fk_rails_d2069138be  (product_size_id => product_sizes.id)
#  fk_rails_e3cb28f071  (order_id => orders.id)
#  fk_rails_f1a29ddd47  (product_id => products.id)
#

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
