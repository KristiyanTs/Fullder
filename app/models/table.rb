# frozen_string_literal: true
# == Schema Information
#
# Table name: tables
#
#  id            :integer          not null, primary key
#  number        :integer
#  capacity      :integer
#  code          :string           not null
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

class Table < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  has_many :orders

  before_validation :generate_code
  
  validates :number, uniqueness: { scope: :restaurant_id }
  validates :number, presence: true
  validates :code, uniqueness: true
  validates :code, presence: true
  validates :capacity, presence: true

  scope :search, lambda { |keyword|
    unless keyword.blank?
      where(capacity: keyword) if keyword
    end
  }

  private

  def generate_code
    self.code = rand(36**4).to_s(36) if code.nil?
    generate_code if Table.exists?(code: self.code)
  end
end
