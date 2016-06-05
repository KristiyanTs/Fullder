# == Schema Information
#
# Table name: positions
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  restaurant_id   :integer
#  role            :string
#  description     :text
#  create_meal     :boolean
#  edit_menu       :boolean
#  create_position :boolean
#  edit_position   :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Position < ActiveRecord::Base
  has_many :roles, dependent: :destroy
  belongs_to :user
  belongs_to :restaurant
end
