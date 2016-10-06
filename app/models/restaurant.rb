# frozen_string_literal: true
# == Schema Information
#
# Table name: restaurants
#
#  id                             :integer          not null, primary key
#  name                           :string
#  address                        :string
#  wifipassword                   :string
#  description                    :text
#  phone_number                   :string
#  country                        :string           default("en-GB")
#  latitude                       :float
#  longitude                      :float
#  sells_online                   :boolean
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  restaurant_avatar_file_name    :string
#  restaurant_avatar_content_type :string
#  restaurant_avatar_file_size    :integer
#  restaurant_avatar_updated_at   :datetime
#  slug                           :string
#  accepts_reservations           :boolean
#  accepts_deliveries             :boolean
#  google_id                      :string
#
# Indexes
#
#  index_restaurants_on_slug  (slug) UNIQUE
#

class Restaurant < ApplicationRecord
  extend FriendlyId
  friendly_id :slugged_candidates, use: :slugged

  acts_as_taggable

  has_many :categories, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :permission_roles, dependent: :destroy
  has_many :orders
  has_many :order_items, through: :orders
  has_many :tables, dependent: :destroy
  has_many :working_times, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user
  has_many :reservations

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  accepts_nested_attributes_for :working_times, allow_destroy: true
  accepts_nested_attributes_for :images, reject_if: :all_blank,
                                         allow_destroy: true

  has_attached_file :restaurant_avatar, styles: { large: '1000x800' },
                                        default_url: '/images/:style/missing.png'
  validates_attachment_content_type :restaurant_avatar,
                                    content_type: /\Aimage\/.*\Z/

  geocoded_by :address # can also be an IP address

  after_validation :geocode, if: :address_changed? # auto-fetch coordinates

  acts_as_mappable :default_units => :kms,
                   :default_formula => :flat,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  scope :search, -> (keyword) do
    unless keyword.blank?
      keywords = keyword.split(/\W+/) 
      tagged_with(keywords)
    end
  end

  def working?
    working_times.any?(&:active_now?)
  end

  def slugged_candidates
    [
      :name,
      [:name, :address],
      [:name, :longitude, :latitude],
      [:name, :address, :longitude, :latitude]
    ]
  end

  def load_working_hours(periods)
    periods.each do |period|
      work_time = self.working_times.new
      work_time.update(from_time: Time.new.change(hour: period["open"]["time"].first(2), min: period["open"]["time"].last(2)))
      work_time.update(from_day: period["open"]["day"])
      work_time.update(to_time: Time.new.change(hour: period["close"]["time"].first(2), min: period["close"]["time"].last(2)))
      work_time.update(to_day: period["close"]["day"])
    end
  end
  translates :description
end
