# == Schema Information
#
# Table name: tables
#
#  id            :integer          not null, primary key
#  number        :integer
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_tables_on_restaurant_id  (restaurant_id)
#  index_tables_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_0700cfe41e  (restaurant_id => restaurants.id)
#  fk_rails_7b7f01e20c  (user_id => users.id)
#

class Table < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  has_many :orders


  validates_uniqueness_of :number, scope: :restaurant_id
end
