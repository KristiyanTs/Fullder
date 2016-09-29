desc "to use this task write 'rake seed_restaurants place=Restaurants in ...'"
task :seed_restaurants => :environment do
  @client = GooglePlaces::Client.new("AIzaSyADZdRRUvCvt0ARmLVrlFlXaB8f4l1ItJE")
  restaurants = @client.spots_by_query(ENV['place'])
  puts restaurants.count
  restaurants.each do |restaurant|
    u = Restaurant.find_or_create_by(name:         restaurant.name,
                                 address:      restaurant.formatted_address,
                                 phone_number: restaurant.formatted_phone_number || "Not provided")
    u.tag_list = restaurant.types.join(", ")
    u.restaurant_avatar = URI.parse("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" + restaurant.photos.first.photo_reference + "&key=AIzaSyADZdRRUvCvt0ARmLVrlFlXaB8f4l1ItJE")
    u.save

    puts "created " + restaurant.name
  end
end