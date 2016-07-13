# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_roles_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_a5d1cc5ecc  (restaurant_id => restaurants.id)
#

require 'rails_helper'

RSpec.describe Role, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
