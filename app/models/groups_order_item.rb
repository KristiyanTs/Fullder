# == Schema Information
#
# Table name: groups_order_items
#
#  id            :integer          not null, primary key
#  group_id      :integer
#  order_item_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_groups_order_items_on_group_id       (group_id)
#  index_groups_order_items_on_order_item_id  (order_item_id)
#
# Foreign Keys
#
#  fk_rails_5af893f243  (order_item_id => order_items.id)
#  fk_rails_a8749a46c5  (group_id => groups.id)
#

class GroupsOrderItem < ApplicationRecord
  belongs_to :group
  belongs_to :order_item
end
