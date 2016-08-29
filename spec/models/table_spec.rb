# frozen_string_literal: true
# == Schema Information
#
# Table name: tables
#
#  id            :integer          not null, primary key
#  number        :integer
#  capacity      :integer
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_tables_on_restaurant_id  (restaurant_id)
#  index_tables_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_0700cfe41e  (restaurant_id => restaurants.id)
#  fk_rails_7b7f01e20c  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Table, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
