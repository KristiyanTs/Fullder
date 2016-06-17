# == Schema Information
#
# Table name: supplementals
#
#  id          :integer          not null, primary key
#  meal_id     :integer
#  name        :string
#  description :text
#  price       :decimal(10, 2)
#

require 'rails_helper'

RSpec.describe Supplemental, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
