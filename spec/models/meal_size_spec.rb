# == Schema Information
#
# Table name: meal_sizes
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  price       :decimal(, )
#  meal_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe MealSize, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
