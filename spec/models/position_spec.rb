# frozen_string_literal: true
# == Schema Information
#
# Table name: positions
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  user_id       :integer
#  role_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_positions_on_restaurant_id  (restaurant_id)
#  index_positions_on_role_id        (role_id)
#  index_positions_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_4e4581e38b  (user_id => users.id)
#  fk_rails_50ecf01a29  (restaurant_id => restaurants.id)
#  fk_rails_60d189a78f  (role_id => roles.id)
#

require 'rails_helper'

RSpec.describe Position, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
