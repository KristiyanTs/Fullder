# frozen_string_literal: true
# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  product_id :integer
#  price      :decimal(, )      default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sizes_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_d93d1762ca  (product_id => products.id)
#

class Size < ApplicationRecord
  belongs_to :product

  has_many :order_items

  translates :name, :description
end
