class Restaurant < ActiveRecord::Base
  has_one :menu
  has_many :categories, through: :menu
  has_many :meals, through: :categories

  has_many :working_hours
  has_many :positions
  has_many :roles, through: :positions
end
