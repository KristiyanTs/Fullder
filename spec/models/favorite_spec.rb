# frozen_string_literal: true
# == Schema Information
#
# Table name: favorites
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_favorites_on_restaurant_id  (restaurant_id)
#  index_favorites_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_287d36f897  (restaurant_id => restaurants.id)
#  fk_rails_d15744e438  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
