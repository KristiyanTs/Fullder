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

FactoryGirl.define do
  factory :order_item do
    product nil
    order nil
    product_size nil
    unit_price '9.99'
    quantity 1
    total_price '9.99'
  end
end
