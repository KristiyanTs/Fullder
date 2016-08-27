# Worker for importing xls and csv files into menus.
class MenuImportWorker
  include Sidekiq::Worker

  def perform(restaurant_id, file_name)
    Product.import!(restaurant_id, file_name)
  end
end
