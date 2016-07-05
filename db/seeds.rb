# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO: Discuss #destroy_all method

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

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress" # Still in cart before paying
OrderStatus.create! id: 2, name: "Payed" # Payed, but not delivered to restaurant
OrderStatus.create! id: 3, name: "Approved" # Delivered to restaurant
OrderStatus.create! id: 4, name: "Ready"  #When out of kitchen


p "Created Order statuses"

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

category_seed = [
  {
    name: "Lunch",
    available_all_day: false,
    age_restriction: false,
    avatar: File.open(File.join(Rails.root, "app/assets/images/desserts.jpg"))
  },
  {
    name: "Salad",
    available_all_day: true,
    age_restriction: false,
    avatar: File.open(File.join(Rails.root, "app/assets/images/salads.jpeg"))
  },
  {
    name: 'Smoking',
    available_all_day: true,
    age_restriction: true,
    avatar: File.open(File.join(Rails.root, "app/assets/images/wines.jpeg"))
  }
]

product_seed = [
  {
    name: "Shopska salata",
    category_id: 2,
    short_description: "Cucumbers, Tomatoes, Cheese, Olive oil",
    avatar: File.open(File.join(Rails.root, "app/assets/images/shopska_salad.jpg"))
  },
  {
    name: "Duner",
    category_id: 1,
    short_description: "Bread, Chicken meat, Patatoes, White sauce",
    avatar: File.open(File.join(Rails.root, "app/assets/images/duner.jpg"))
  },
  {
    name: "Shisha",
    category_id: 3,
    avatar: File.open(File.join(Rails.root, "app/assets/images/shisha.jpg"))
  }
]


rest_ids = []
menu_ids = []
category_ids = []
product_ids = []
meal_size_ids = []

restaurant_seed.each do |restaurant_params|
  rest_ids << Restaurant.find_or_create_by(restaurant_params).id
end

p "Created #{Restaurant.count} restaurant"

category_seed.each do |category_params|
  rest_ids.each do |rest_id|
    category_ids << Category.find_or_create_by(category_params
      .merge(restaurant_id: rest_id)
      .except(:avatar)) do |cat|
        cat.avatar = category_params[:avatar]
      end.id
  end
end

p "Created #{Category.count} categories"


# product_seed.each do |product_params|
#   rest_ids.each do |restaurant_id|
#     product_ids << Product.find_or_create_by(product_params
#       .merge(restaurant_id: restaurant_id)
#       .except(:avatar)) do |product|
#         product.avatar = product_params[:avatar]
#       end.id
#   end
# end

# p "Created #{Product.count} products"


puts 'Done ...'
