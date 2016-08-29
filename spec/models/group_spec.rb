# frozen_string_literal: true
# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  product_id :integer
#  maximum    :integer
#  name       :string
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

require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
