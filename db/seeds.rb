# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO: Discuss #destroy_all method
User.destroy_all
Restaurant.destroy_all


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

p "Created #{User.count} users"

restaurant_seed = [
  {
    name: "KFC",
    address: "Sofia",
    description: "Fast food.",
    phone_number: "88888888"
  },
  {
    name: "McDonals",
    address: "Varna",
    description: "Mc OOD",
    phone_number: "99999999"
  }
]

menu_seed = [
  {
    name: 'Spring menu',
    active: true
  },
  {
    name: 'Winter menu',
    active: false
  }
]

category_seed = [
  {
    name: "Dessert",
    available_all_day: false,
    age_restriction: false,
    category_avatar: File.open(File.join(Rails.root, "app/assets/images/desserts.jpg"))
  },
  {
    name: "Salad",
    available_all_day: true,
    age_restriction: false,
    category_avatar: File.open(File.join(Rails.root, "app/assets/images/salads.jpeg"))
  },
  {
    name: 'Wine',
    available_all_day: true,
    age_restriction: true,
    category_avatar: File.open(File.join(Rails.root, "app/assets/images/wines.jpeg"))
  }
]

meal_seed = [
  {
    name: "Shopska salata",
    short_description: "Cucumbers, Tomatoes, Cheese, Olive oil",
    meal_avatar: File.open(File.join(Rails.root, "app/assets/images/shopska_salad.jpg"))
  },
  {
    name: "Duner",
    short_description: "Bread, Chicken meat, Patatoes, White sauce",
    meal_avatar: File.open(File.join(Rails.root, "app/assets/images/duner.jpg"))
  },
  {
    name: "Shisha",
    meal_avatar: File.open(File.join(Rails.root, "app/assets/images/shisha.jpg"))
  }
]

meal_size_seed = [
  {
    description: "hey",
    name: "Small",
    price: 3.99
  },
  {
    description: "bey",
    name: "Medium",
    price: 5.59
  },
  {
    description: "mey",
    name: "Large",
    price: 7.39
  }
]


rest_ids = []
menu_ids = []
category_ids = []
meal_ids = []
meal_size_ids = []

restaurant_seed.each do |restaurant_params|
  rest_ids << Restaurant.find_or_create_by(restaurant_params).id
end

menu_seed.each do |menu_params|
  rest_ids.each do |rest_id|
    menu_ids << Menu.create(menu_params.merge(restaurant_id: rest_id)).id
  end
end

category_seed.each do |category_params|
  menu_ids.each do |menu_id|
    category_ids << Category.find_or_create_by(category_params
      .merge(menu_id: menu_id)
      .except(:category_avatar)) do |cat|
        cat.category_avatar = category_params[:category_avatar]
      end.id
  end
end

# meal_seed.each do |meal_params|
#   category_ids.each do |cat_id|
#     meal_ids << Meal.find_or_create_by(meal_params
#       .merge(category_id: cat_id)
#       .except(:meal_avatar)) do |meal|
#         meal.meal_avatar = meal_params[:meal_avatar]
#       end.id
#   end
# end

# meal_size_seed.each do |meal_size_params|
#   meal_ids.each do |meal_id|
#     meal_size_ids << MealSize.find_or_create_by(meal_size_params).id
#   end
# end

puts 'Done ...'
