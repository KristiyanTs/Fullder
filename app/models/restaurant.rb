# == Schema Information
#
# Table name: restaurants
#
#  id           :integer          not null, primary key
#  name         :string
#  address      :string
#  description  :text
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Restaurant < ActiveRecord::Base
  has_one :menu
  has_many :categories, through: :menu, :dependent => :destroy
  has_many :meals, through: :categories, :dependent => :destroy

  has_many :working_hours, :dependent => :destroy
  has_many :positions, :dependent => :destroy
  has_many :roles, through: :positions, :dependent => :destroy
end
