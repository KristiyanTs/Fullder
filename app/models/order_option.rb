# == Schema Information
#
# Table name: order_options
#
#  id                :integer          not null, primary key
#  order_item_id     :integer
#  product_option_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_order_options_on_order_item_id      (order_item_id)
#  index_order_options_on_product_option_id  (product_option_id)
#
# Foreign Keys
#
#  fk_rails_567d8d4a38  (order_item_id => order_items.id)
#  fk_rails_e1a9d23ec6  (product_option_id => product_options.id)
#

class OrderOption < ApplicationRecord
  belongs_to :order_item
  belongs_to :product_option
end
