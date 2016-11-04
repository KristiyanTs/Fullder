# frozen_string_literal: true
# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  product_id :integer
#  maximum    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_865905e981  (product_id => products.id)
#

class Group < ApplicationRecord
  belongs_to :product

  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true

  has_many :groups_order_items
  has_many :order_items, through: :groups_order_items

  translates :name
end
