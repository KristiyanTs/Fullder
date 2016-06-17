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

class Supplemental < ActiveRecord::Base
  belongs_to :meal
end
