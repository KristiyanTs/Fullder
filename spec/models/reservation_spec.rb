# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  from       :datetime
#  to         :datetime
#  table_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
