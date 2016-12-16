# frozen_string_literal: true
# In order to use this rake task
# you need to pass city and place ENV
# like so:
# `rake google_restaurant_importer city=Sofia place=Restaurant`
desc 'Google restaurant importer'
task google_restaurant_importer: :environment do
  @client = GooglePlaces::Client.new(api_key)
  restaurants = @client.spots_by_query("#{place} in #{city}")
  puts "Found #{restaurants.count} restaurants."

  restaurants.each do |restaurant|
    res = @client.spot(restaurant.place_id)

    next if Restaurant.find_by(google_id: res.place_id)
    Restaurant.find_or_create_by(google_api_data(res)) do |rest|
      rest.tag_list = res.types.join(', ')
      rest.restaurant_avatar = google_avatar(res.photos) if res.photos.any?
      rest.load_working_hours(res[:opening_hours]['periods']) if res[:opening_hours]['periods'].present?

      rest.save!
      puts "#{rest.name} was created successfully."
    end
  end
end

def google_avatar(photos)
  photo_reference = photos.first.photo_reference
  "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=#{api_key}"
end

def api_key
  'AIzaSyADZdRRUvCvt0ARmLVrlFlXaB8f4l1ItJE'
end

def google_api_data(place)
  {
    name: place.name,
    address: place.formatted_address,
    phone_number: place.international_phone_number || 'Not provided',
    google_id: place.place_id
  }
end

def city
  ENV['city'] || raise('City not given error.')
end

def place
  ENV['place'] || raise('Place not given error.')
end
