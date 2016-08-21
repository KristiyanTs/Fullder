# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  admin                  :boolean          default(FALSE)
#  name                   :string
#  phone_number           :string
#  address                :string
#  locale                 :string           default("en")
#  provider               :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  has_many :positions
  has_many :roles, through: :positions
  has_many :orders
  has_many :tables
  has_many :reservations
  has_many :favorites, dependent: :destroy
  has_many :favorite_restaurants, through: :favorites, source: :restaurant

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :twitter]
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  acts_as_taggable
  acts_as_taggable_on :allergens

  def self.from_omniauth(token)
    user = User.find_by(uid: token['uid'])
    unless user
      user = User.new(
        name: token.info['name'],
        provider: token['provider'],
        uid: token['uid'],
        email: token.info['email'] || SecureRandom.hex(5) + "@changemeplease.com",
        password: Devise.friendly_token[0, 20]
      )
      user.skip_confirmation! unless token.info['email'].nil?
      user.save!
    end
    user
  end

  def password_required?
    super && provider.blank?
  end

end
