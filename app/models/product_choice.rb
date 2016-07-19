# frozen_string_literal: true
# == Schema Information
#
# Table name: product_choices
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductChoice < ActiveRecord::Base
  belongs_to :product
end
