# == Schema Information
#
# Table name: product_option_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  maximum    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_option_groups_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_40ec271695  (product_id => products.id)
#

class ProductOptionGroup < ApplicationRecord
  belongs_to :product

  has_many :product_options, dependent: :destroy

  accepts_nested_attributes_for :product_options, allow_destroy: true

  translates :name
end
