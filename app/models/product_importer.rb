class ProductImporter
  DEFAULT_OPTIONS = {
    folder: 'tmp/menu_import',
    delete: true
  }.freeze

  def self.import!(restaurant_id, file_name, options = {})
    options = DEFAULT_OPTIONS.merge(options)
    file_path = Rails.root.join(options[:folder], file_name)
    spreadsheet = open_spreadsheet(file_name, file_path)
    sheet = spreadsheet.sheet(0)
    headers = sheet.row(2).map(&:squish)
    ((sheet.first_row + 2)..(sheet.last_row)).each do |idx|
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
        next if size.any? { |k, v| v.nil? }
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
        group_hash['options'].split(',').each do |option_name|
          option_name.squish!
          g.options.new(name: option_name)
        end
        g.save
      end

      debugger # size_params
      size_params.each do |size_hash|
        p.sizes.find_or_initialize_by(size_hash)
      end

      p.save!
    end

    File.delete(file_path) if File.exist?(file_path) && options[:delete]
  end

  def self.open_spreadsheet(file_name, file_path)
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
end
