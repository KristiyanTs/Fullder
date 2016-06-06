# == Schema Information
#
# Table name: categories
#
#  id                :integer          not null, primary key
#  menu_id           :integer
#  age_restriction   :boolean
#  available_all_day :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  working_hour_id   :integer
#  name              :string
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
