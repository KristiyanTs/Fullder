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

class Supplemental < ActiveRecord::Base
  belongs_to :meal
  belongs_to :order
end
