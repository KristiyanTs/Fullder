json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address, :description, :woring_time, :tlephone_number, :rating
  json.url restaurant_url(restaurant, format: :json)
end
