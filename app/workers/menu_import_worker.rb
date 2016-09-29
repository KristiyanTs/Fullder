# Worker for importing xls and csv files into menus.
class MenuImportWorker
  include Sidekiq::Worker

  def perform(restaurant_id, file_name)
    MenuImporter.new(restaurant_id: restaurant_id, file_name: file_name).import!
  end
end
