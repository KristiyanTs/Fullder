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

class MealSize < ActiveRecord::Base
  belongs_to :meal
end
