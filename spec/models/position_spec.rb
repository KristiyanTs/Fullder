# == Schema Information
#
# Table name: positions
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  role_id       :integer
#  restaurant_id :integer
#

require 'rails_helper'

RSpec.describe Position, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
