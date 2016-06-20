# == Schema Information
#
# Table name: supplementals
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  meal_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Supplemental, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
