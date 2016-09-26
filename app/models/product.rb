# frozen_string_literal: true
# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  restaurant_id        :integer
#  category_id          :integer
#  name                 :string
#  short_description    :string
#  description          :text
#  price                :decimal(, )
#  active               :boolean
#  average_prepare_time :integer
#  ready                :boolean
#  created_at           :datetime
#  updated_at           :datetime
#  avatar_file_name     :string
#  avatar_content_type  :string
#  avatar_file_size     :integer
#  avatar_updated_at    :datetime
#
# Indexes
#
#  index_products_on_category_id    (category_id)
#  index_products_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_009fa2d872  (restaurant_id => restaurants.id)
#  fk_rails_fb915499a4  (category_id => categories.id)
#

class Product < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category

  has_many :sizes, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :options, through: :groups
  has_many :order_items

  accepts_nested_attributes_for :sizes, allow_destroy: true
  accepts_nested_attributes_for :groups, allow_destroy: true

  default_scope { where(active: true) }

  has_attached_file :avatar, styles: { small: '140x140#', large: '250x250#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, length: { maximum: 24 }
  validates :category_id, presence: true
  validates :short_description, presence: true
  validates :price, presence: true

  acts_as_taggable
  acts_as_taggable_on :allergens

  translates :name, :short_description, :description

  scope :search, -> (keyword) do
    unless keyword.blank?
      keyword = "%#{keyword}%"
      where('products.name ilike ?',
            keyword)
    end
  end

  def calculate_average_time
    items = order_items.where(status: 'delivered')
    self[:average_prepare_time] = items.average('ready_at - received_at')
  end


  def self.import!(restaurant_id, file_name)
    file_path = Rails.root.join('tmp/menu_import', file_name)
    spreadsheet = open_spreadsheet(file_name, file_path)
    sheet = spreadsheet.sheet(0)
    headers = sheet.row(2).map(&:squish)
    ((sheet.first_row + 2)..sheet.last_row).each do |idx|
      row = sheet.row(idx)
      params = Hash[headers.zip(row)]
      group_keys = params.keys.select { |k| k.include? 'group_' }
      size_keys = params.keys.select { |k| k.include? 'size_' }
      product_keys = params.keys - group_keys - size_keys - ['category']
      product_category = params['category']

      rest = Restaurant.find(restaurant_id)
      product_params = {}
      product_keys.each do |column|
        product_params[column] = params[column]
      end

      groups = group_keys.each_slice(3).to_a
      group_params = []
      groups.each do |group|
        group_hash = {}
        group.each do |column|
          if column.include? 'max'
            group_hash['maximum'] = params[column]
          else
            attr = column.split('_')[2]
            group_hash[attr] = params[column]
          end
        end
        group_params << group_hash
      end

      sizes = size_keys.each_slice(3).to_a
      size_params = []
      sizes.each do |size|
        size_hash = {}
        size.each do |column|
          attr = column.split('_')[2]
          size_hash[attr] = params[column]
        end
        size_params << size_hash
      end

      p = rest.products.build(product_params)
      p.category = Category.find_or_create_by(name: product_category)
      group_params.each do |group_hash|
        g = p.groups.find_or_initialize_by(group_hash.except('options'))
        g.options.destroy_all
        group_hash['options'].split(', ').each do |option_name|
          g.options.new(name: option_name)
        end
        g.save
      end

      size_params.each do |size_hash|
        p.sizes.find_or_initialize_by(size_hash)
      end

      p.save!
    end

    File.delete(file_path) if File.exist?(file_path)
  end

  def self.open_spreadsheet(file_name, file_path)
    case File.extname(file_name)
    when '.csv' then Roo::Csv.new(file_path,
                                  packed: nil,
                                  file_warning: :ignore)
    when '.xls' then Roo::Excel.new(file_path,
                                    packed: nil,
                                    file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file_path,
                                      packed: nil,
                                      file_warning: :ignore)
    else raise "Unknown file type: #{file_name}"
    end
  end
end
