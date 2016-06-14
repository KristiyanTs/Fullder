# == Schema Information
#
# Table name: menus
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string
#  active        :boolean
#

class Menu < ActiveRecord::Base
  before_save :default_values

  belongs_to :restaurant

  has_many :categories, dependent: :destroy

  accepts_nested_attributes_for :categories

  validates :name, uniqueness: { scope: :restaurant_id,
                                 message: 'You should not have two menus with the same name' }

  def default_values
    self.active = false if active.nil?
  end
end
