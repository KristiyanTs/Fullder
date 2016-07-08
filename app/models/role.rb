class Role < ActiveRecord::Base
  belongs_to :restaurant

  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions
end
