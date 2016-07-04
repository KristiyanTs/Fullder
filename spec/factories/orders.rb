# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  order_status_id :integer
#  subtotal        :decimal(, )
#  tax             :decimal(, )
#  shipping        :decimal(, )
#  tip             :decimal(, )
#  total           :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
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
