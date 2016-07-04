# == Schema Information
#
# Table name: product_sizes
#
#  id                :integer          not null, primary key
#  product_id        :integer
#  name              :string
#  price             :decimal(, )
#  short_description :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe ProductSize, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
