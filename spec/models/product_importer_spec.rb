require 'rails_helper'

RSpec.describe ProductImporter, type: :model do
  before(:each) do
    @restaurant = Restaurant.create(name: 'test_restaurant')
    @file_name = 'test_menu_ok.xlsx'
    @folder = 'test/fixtures/product_importer'
    @initial_products = Product.all.count
    @initial_categories = Category.all.count
    @initial_sizes = Category.all.count
    @initial_groups = Group.all.count
    @initial_options = Option.all.count
  end

  describe '#import!' do
    it 'should not fail if given correct table' do
      expect do
        ProductImporter.import!(@restaurant.id, @file_name, folder: @folder, delete: false)
      end.to_not raise_error
    end

    it 'should fail if given incorrect table' do
    end

    it 'creates new categories' do
      ProductImporter.import!(@restaurant.id, @file_name, folder: @folder, delte: false)
      expect { Category.all.count }.to_eq @initial_categories + 4
    end

    it 'creates new products' do
      ProductImporter.import!(@restaurant.id, @file_name, folder: @folder, delte: false)
      expect { Product.all.count }.to_eq @initial_products + 9
    end

    it 'creates new groups' do
      ProductImporter.import!(@restaurant.id, @file_name, folder: @folder, delte: false)
      expect { Group.all.count }.to_eq @initial_groups + 9
    end

    it 'creates new sizes' do
      ProductImporter.import!(@restaurant.id, @file_name, folder: @folder, delte: false)
      expect { Size.all.count }.to_eq @initial_sizes + 18
    end

    it 'creates new options' do
      ProductImporter.import!(@restaurant.id, @file_name, folder: @folder, delte: false)
      expect { Option.all.count }.to_eq @initial_options + 28
    end
  end
end
