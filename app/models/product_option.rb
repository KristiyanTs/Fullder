# == Schema Information
#
# Table name: product_options
#
#  id                      :integer          not null, primary key
#  name                    :string
#  product_option_group_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_product_options_on_product_option_group_id  (product_option_group_id)
#
# Foreign Keys
#
#  fk_rails_dbd0297af6  (product_option_group_id => product_option_groups.id)
#

class ProductOption < ApplicationRecord
  belongs_to :product_option_group

  has_many :order_options
  has_many :order_items, through: :order_options

  translates :name
end
