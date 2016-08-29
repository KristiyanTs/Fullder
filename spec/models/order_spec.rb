# frozen_string_literal: true
# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  order_status_id :integer
#  restaurant_id   :integer
#  user_id         :integer
#  table_id        :integer
#  subtotal        :decimal(, )
#  tax             :decimal(, )
#  shipping        :decimal(, )
#  tip             :decimal(, )
#  total           :decimal(, )
#  table_number    :integer
#  address         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_orders_on_order_status_id  (order_status_id)
#  index_orders_on_restaurant_id    (restaurant_id)
#  index_orders_on_table_id         (table_id)
#  index_orders_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_7a22cf8b0e  (order_status_id => order_statuses.id)
#  fk_rails_9af093cac8  (restaurant_id => restaurants.id)
#  fk_rails_aaccb1d5d0  (table_id => tables.id)
#  fk_rails_f868b47f6a  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
