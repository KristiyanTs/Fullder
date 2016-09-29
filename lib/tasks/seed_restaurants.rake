desc "to use this task write 'rake seed_restaurants place=Restaurants in ...'"
task seed_restaurants: :environment do
  @client = GooglePlaces::Client.new("AIzaSyADZdRRUvCvt0ARmLVrlFlXaB8f4l1ItJE")
  restaurants = @client.spots_by_query(ENV['place'])
  
  restaurants.each do |restaurant|
    res = @client.spot(restaurant.place_id)

    unless Restaurant.find_by(google_id: res.place_id)
      new_restaurant = Restaurant.find_or_create_by(name: res.name,
                                       address: res.formatted_address,
                                       phone_number: res.international_phone_number || "Not provided",
                                       google_id: res.place_id)
      new_restaurant.tag_list = res.types.join(", ")
      new_restaurant.restaurant_avatar = URI.parse("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" + res.photos.first.photo_reference + "&key=AIzaSyADZdRRUvCvt0ARmLVrlFlXaB8f4l1ItJE")
    
      res[:opening_hours][:periods].each do |period|
        k = new_restaurant.working_times.new
        k.update(from_time: Time.new.change(hour: period["open"]["time"].first(2), min: period["open"]["time"].last(2)))
        k.update(from_day: period["open"]["day"])
        k.update(to_time: Time.new.change(hour: period["close"]["time"].first(2), min: period["close"]["time"].last(2)))
        k.update(to_day: period["close"]["day"])
      end

      new_restaurant.save
      puts "#{res.name} was created successfully."
    end
  end
end