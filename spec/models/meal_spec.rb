# == Schema Information
#
# Table name: meals
#
#  id                       :integer          not null, primary key
#  name                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  category_id              :integer
#  meal_avatar_file_name    :string
#  meal_avatar_content_type :string
#  meal_avatar_file_size    :integer
#  meal_avatar_updated_at   :datetime
#  restaurant_id            :integer
#  menu_id                  :integer
#

require 'rails_helper'

RSpec.describe Meal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
