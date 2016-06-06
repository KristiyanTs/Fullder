# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Generating seeds..."

restaurant_seed = [
  {
    name: "KFC",
    address: "Sofia",
    description: "Fast food.",
    phone_number: "88888888"
  }
]

menu_seed = [
  {
    name: 'Spring menu.',
    active: true
  },
  {
    # TODO: add default active false
    name: 'Winter menu.',
    active: false
  }
]

category_seed = [
  {
    name: "Dessert",
    available_all_day: false,
    age_restriction: false
  },
  {
    name: "Salad",
    available_all_day: true,
    age_restriction: false
  },
  {
    name: 'Wine',
    available_all_day: true,
    age_restriction: true
  }
]

restaurant_seed.each do |restaurant_params|
  res = Restaurant.find_or_create_by(restaurant_params)
  menu_seed.each do |menu_params|
    res.menus.find_or_create_by(menu_params)
    res.save
  end
end

puts 'Done ...'
