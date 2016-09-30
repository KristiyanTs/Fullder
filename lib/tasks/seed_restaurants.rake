desc "to use this task write rake seed_restaurants 'Restaurant' 'Edinburgh'"
task seed_restaurants: :environment do
  what, where = ARGV
  api_key = "AIzaSyADZdRRUvCvt0ARmLVrlFlXaB8f4l1ItJE"
  @client = GooglePlaces::Client.new(api_key)
  restaurants = @client.spots_by_query("#{what} in #{where}")
  puts "Found #{restaurants.count} restaurants."

  restaurants.each do |restaurant|
    res = @client.spot(restaurant.place_id)

    unless Restaurant.find_by(google_id: res.place_id)
      new_restaurant = Restaurant.find_or_create_by(name: res.name,
                                                    address: res.formatted_address,
                                                    phone_number: res.international_phone_number || "Not provided",
                                                    google_id: res.place_id)

      new_restaurant.tag_list = res.types.join(", ")
      new_restaurant.avatar_remote_url("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{res.photos.first.photo_reference}&key=#{api_key}") if res.photos.first
      new_restaurant.load_working_hours(res[:opening_hours]["periods"]) if res[:opening_hours]

      new_restaurant.save
      puts "#{res.name} was created successfully."
    end
  end
end