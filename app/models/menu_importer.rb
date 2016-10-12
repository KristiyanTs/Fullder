class MenuImporter
  attr_reader :restaurant,
              :options,
              :headers

  DEFAULT_OPTIONS = {
    folder: 'tmp/menu_import',
    delete: true
  }.freeze

  def initialize(args)
    @restaurant = Restaurant.find(args[:restaurant_id])
    @options = DEFAULT_OPTIONS.merge(args)
  end

  def import!
    Rails.logger.info "Starting to import in menu_importer"
    ((sheet.first_row + 2)..(sheet.last_row)).each do |idx|
      row = sheet.row(idx)
      params = Hash[headers.zip(row)]
      group_keys = params.keys.select { |k| k.include? 'group_' }
      size_keys = params.keys.select { |k| k.include? 'size_' }
      product_keys = params.keys - group_keys - size_keys - ['category']
      product_category = params['category']

      product_params = parse_product_params(product_keys, params)
      group_params = parse_group_params(group_keys, params)
      size_params = parse_size_params(size_keys, params)

      restaurant.products.find_or_initialize_by(name: product_params['name']).tap do |p|
        p.update_attributes(product_params.except('name'))
        p.category = restaurant.categories
                               .find_or_create_by(name: product_category)
        group_params.each do |group_hash|
          g = p.groups.find_or_initialize_by(group_hash.except('options'))
          g.options.destroy_all
          group_hash['options'].split(',').each do |option_name|
            option_name.squish!
            g.options.new(name: option_name)
          end
          g.save
        end

        size_params.each do |size_hash|
          p.sizes.find_or_initialize_by(size_hash)
        end

        p.save!
      end
    end
    File.delete(file_path) if File.exist?(file_path) && options[:delete]
  end

  private

  def file_name
    @file_name ||= options[:file_name]
  end

  def file_path
    @file_path ||= Rails.root.join(options[:folder], file_name)
  end

  def spreadsheet
    @spreadsheet ||=
      case File.extname(file_name)
      when '.csv'
        then Roo::Csv.new(file_path, packed: nil, file_warning: :ignore)
      when '.xls'
        then Roo::Excel.new(file_path, packed: nil, file_warning: :ignore)
      when '.xlsx'
        then Roo::Excelx.new(file_path, packed: nil, file_warning: :ignore)
      else raise "Unknown file type: #{file_name}"
      end
  end

  def sheet
    @sheet ||= spreadsheet.sheet(0)
  end

  def headers
    @headers ||= sheet.row(2).map(&:squish)
  end

  def parse_product_params(keys, params)
    {}.tap do |product_params|
      keys.each do |column|
        product_params[column] = params[column]
      end
    end
  end

  def parse_group_params(keys, params)
    groups = keys.each_slice(3).to_a
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
    group_params
  end

  def parse_size_params(keys, params)
    sizes = keys.each_slice(3).to_a
    size_params = []
    sizes.each do |size|
      size_hash = {}
      size.each do |column|
        attr = column.split('_')[2]
        size_hash[attr] = params[column]
      end
      size_params << size_hash
    end
    size_params
  end
end