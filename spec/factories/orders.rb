# frozen_string_literal: true
# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  order_status_id :integer
#  restaurant_id   :integer
#  user_id         :integer
#  subtotal        :decimal(, )
#  tax             :decimal(, )
#  shipping        :decimal(, )
#  tip             :decimal(, )
#  total           :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_orders_on_order_status_id  (order_status_id)
#  index_orders_on_restaurant_id    (restaurant_id)
#  index_orders_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_7a22cf8b0e  (order_status_id => order_statuses.id)
#  fk_rails_9af093cac8  (restaurant_id => restaurants.id)
#  fk_rails_f868b47f6a  (user_id => users.id)
#

FactoryGirl.define do
  factory :order do
    subtotal '9.99'
    tax '9.99'
    shipping '9.99'
    tip '9.99'
    total '9.99'
  end
end
