# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO: Discuss #destroy_all method

puts "Generating seeds..."



User.delete_all
User.create!([
           {first_name: 'Kristiyan', last_name: 'Tsvetanov',
            email: 'test1@example.com', password: 'password',
            password_confirmation: 'password', admin: true},
           {first_name: 'Valentina', last_name: 'Latinska',
            email: 'test2@example.com', password: 'password',
            password_confirmation: 'password'},
           {first_name: 'Plamen', last_name: 'Dimitrov',
            email: 'test3@example.com', password: 'password',
            password_confirmation: 'password'},
           {first_name: 'Pesho', last_name: 'Petrov',
            email: 'pesho@abv.bg', password: '123123123',
            password_confirmation: '123123123'}
])

p "Created #{User.count} users"

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress" # Still in cart before paying
OrderStatus.create! id: 2, name: "Payed" # Payed, but not delivered to restaurant
OrderStatus.create! id: 3, name: "Awaiting" # Delivered to restaurant
OrderStatus.create! id: 4, name: "Ready"  #When out of kitchen


p "Created Order statuses"

restaurant_seed = [
  {
    name: "KFC",
    address: "Sofia, bul. Slivnitsa 172",
    description: "Fast food.",
    phone_number: "88888888"
  },
  {
    name: "McDonals",
    address: "Sofia, bul. Maria Luiza 23",
    description: "Mc OOD",
    phone_number: "99999999"
  },
  {
    name: "PizzaHut",
    address: "Sofia, bul. Aleksandar Stamboliisky 101",
    description: "Fast food.",
    phone_number: "88888888"
  },
  {
    name: "Raffy",
    address: "Sofia, ul. Angel Kanchev 11",
    description: "Mc OOD",
    phone_number: "99999999"
  },
  {
    name: "Subway",
    address: "Varna, ul. Akademik Andrei Saharov 2",
    description: "Fast food.",
    phone_number: "88888888"
  },
  {
    name: "Raffy",
    address: "Sofia, bul. Vitosha 18",
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
    price: 3.40,
    short_description: "Cucumbers, Tomatoes, Cheese, Olive oil",
    avatar: File.open(File.join(Rails.root, "app/assets/images/shopska_salad.jpg"))
  },
  {
    name: "Duner",
    category_id: 1,
    price: 3.40,
    short_description: "Bread, Chicken meat, Patatoes, White sauce",
    avatar: File.open(File.join(Rails.root, "app/assets/images/duner.jpg"))
  },
  {
    name: "Shisha",
    category_id: 3,
    price: 3.40,
    avatar: File.open(File.join(Rails.root, "app/assets/images/shisha.jpg"))
  }
]

table_seed = [
  {
    number: '1',
    capacity: '6'
  },
  {
    number: '2',
    capacity: '6'
  },
  {
    number: '3',
    capacity: '4'
  },
  {
    number: '4',
    capacity: '3'
  }
]

rest_ids = []
menu_ids = []
category_ids = []
product_ids = []
meal_size_ids = []
table_ids = []

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
#   rest_ids.each do |rest_id|
#     product_ids << Product.find_or_create_by(product_params
#       .merge(restaurant_id: rest_id)
#       .except(:avatar)) do |prod|
#         prod.avatar = product_params[:avatar]
#       end.id
#   end
# end


# p "Created #{Product.count} products"

table_seed.each do |table_params|
  rest_ids.each do |rest_id|
    table_ids << Table.find_or_create_by(table_params.merge(restaurant_id: rest_id)).id
  end
end

permission_seed = [
  {
    subject_class: "Product",
    action: "read",
    name: "Show all products",
    description: "Allow user to see all products, including the ones which are unactive."
  },
  {
    subject_class: "Product",
    action: "create",
    name: "Create new products",
    description: "Allow user to add new products."
  },
  {
    subject_class: "Product",
    action: "update",
    name: "Update products",
    description: "Allow user to update existing products."
  },
  {
    subject_class: "Product",
    action: "destroy",
    name: "Destroy products",
    description: "Allow user to destroy existing products."
  },
  {
    subject_class: "Category",
    action: "read",
    name: "Show all categories",
    description: "Allow user to see all categories, including the ones which are unactive."
  },
  {
    subject_class: "Category",
    action: "create",
    name: "Create new categories",
    description: "Allow user to add new categories."
  },
  {
    subject_class: "Category",
    action: "update",
    name: "Update categories",
    description: "Allow user to update existing categories."
  },
  {
    subject_class: "Category",
    action: "destroy",
    name: "Destroy categories",
    description: "Allow user to destroy existing categories."
  },
  {
    subject_class: "Role",
    action: "read",
    name: "Show all roles",
    description: "Allow user to see all roles."
  },
  {
    subject_class: "Role",
    action: "create",
    name: "Create new roles",
    description: "Allow user to add new roles."
  },
  {
    subject_class: "Role",
    action: "update",
    name: "Update roles",
    description: "Allow user to update existing roles."
  },
  {
    subject_class: "Role",
    action: "destroy",
    name: "Destroy roles",
    description: "Allow user to destroy existing roles."
  },
  {
    subject_class: "Position",
    action: "read",
    name: "Show all employees",
    description: "Allow user to see all employees, including information about them."
  },
  {
    subject_class: "Position",
    action: "create",
    name: "Add new employees",
    description: "Allow user to add new employees. Be cautious!"
  },
  {
    subject_class: "Position",
    action: "update",
    name: "Update employees",
    description: "Allow user to update information about existing employees. Be cautious!"
  },
  {
    subject_class: "Position",
    action: "destroy",
    name: "Dismiss employees",
    description: "Allow user to dismiss employees. Be cautious!"
  }
]

permission_seed.each do |permission_params|
  Permission.find_or_create_by(permission_params)
end

Role.destroy_all
Role.create! restaurant_id: 1, name: "Manager"

Position.destroy_all
Position.create! restaurant_id: 1, user_id: 1, role_id: 1


puts 'Done ...'
