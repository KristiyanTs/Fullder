# == Schema Information
#
# Table name: orders_product_groups
#
#  id                      :integer          not null, primary key
#  order_item_id           :integer
#  product_option_group_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_orders_product_groups_on_order_item_id            (order_item_id)
#  index_orders_product_groups_on_product_option_group_id  (product_option_group_id)
#
# Foreign Keys
#
#  fk_rails_67a5997523  (product_option_group_id => product_option_groups.id)
#  fk_rails_bf13418782  (order_item_id => order_items.id)
#

class OrdersProductGroup < ApplicationRecord
  belongs_to :order_item
  belongs_to :product_option_group
end
