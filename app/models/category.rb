class Category < ActiveRecord::Base
  has_many :meals
  has_many :working_hours
end
