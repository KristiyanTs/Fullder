class Table < ActiveRecord::Base
  belongs_to :restaurant
  has_many :reservations

  def available?
    available
  end
end
