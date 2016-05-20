class Meal < ActiveRecord::Base
  belongs_to :category
  has_many :meal_sizes
  has_many :supplementals

  has_many :orders
end
