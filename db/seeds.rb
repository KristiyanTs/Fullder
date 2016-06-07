# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Generating seeds..."

User.create(first_name: 'Kristiyan', last_name: 'Tsvetanov',
            email: 'test1@example.com', password: 'password',
            password_confirmation: 'password', admin: true)
User.create(first_name: 'Valentina', last_name: 'Latinska',
            email: 'test2@example.com', password: 'password',
            password_confirmation: 'password')
User.create(first_name: 'Plamen', last_name: 'Dimitrov',
            email: 'test3@example.com', password: 'password',
            password_confirmation: 'password')
User.create(first_name: 'Pesho', last_name: 'Petrov',
            email: 'pesho@abv.bg', password: '123123123',
            password_confirmation: '123123123')

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

meal_seed = [
  {
    name: "Shopska salata",
    meal_avatar: File.new(Rails.root.join("app", "assets", "images", "shopska_salad.jpg"))
  },
  {
    name: "Duner",
    meal_avatar: File.new(Rails.root.join("app", "assets", "images", "duner.jpg"))
  },
  {
    name: "Shisha",
    meal_avatar: File.new(Rails.root.join("app", "assets", "images", "shisha.jpg"))
  }
]

restaurant_seed.each do |restaurant_params|
  res = Restaurant.find_or_create_by(restaurant_params)
  menu_seed.each do |menu_params|
    menu = res.menus.find_or_create_by(menu_params)
    category_seed.each do |category_params|
      category = menu.categories.find_or_create_by(category_params)
      meal_seed.each do |meal_params|
        meal = category.meals.find_or_create_by(meal_params)
      end
    end
  end
end

puts 'Done ...'
