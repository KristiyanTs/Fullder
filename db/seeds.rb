# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO: Discuss #destroy_all method

puts "Generating seeds..."

# User.find_or_create_by([
#            {name: 'Kristiyan Tsvetanov',
#             email: 'test1@example.com', password: 'password',
#             password_confirmation: 'password', admin: true},
#            {name: 'Valentina Latinska',
#             email: 'test2@example.com', password: 'password',
#             password_confirmation: 'password'},
#            {name: 'Plamen Dimitrov',
#             email: 'test3@example.com', password: 'password',
#             password_confirmation: 'password'},
#            {name: 'Pesho Speshno',
#             email: 'pesho@abv.bg', password: '123123123',
#             password_confirmation: '123123123'}
# ])



permission_seed = [
  {
    subject_class: "Restaurant",
    action: "update",
    name: "Update restaurant settings",
    description: "Allow user to update the restaurant settings."
  },
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
  },
  {
    subject_class: "Reservation",
    action: "read",
    name: "Show all reservations",
    description: "Allow user to see all reservations, including information about them."
  },
  {
    subject_class: "Reservation",
    action: "create",
    name: "Add new reservation",
    description: "Allow user to add new reservations."
  },
  {
    subject_class: "Reservation",
    action: "update",
    name: "Update existing reservations",
    description: "Allow user to update information about existing reservations."
  },
  {
    subject_class: "Reservation",
    action: "destroy",
    name: "Delete reservations",
    description: "Allow user to delete reservations."
  },
  {
    subject_class: "Reservation",
    action: "update_available_tables",
    name: "Advanced reservations options",
    description: "Makes the process of creating a reservation easier."
  },
  {
    subject_class: "OrderItem",
    action: "read",
    name: "See orders",
    description: "Allow to see the orders."
  },
  {
    subject_class: "OrderItem",
    action: "update",
    name: "Update orders",
    description: "Allow to update the orders."
  },
  {
    subject_class: "OrderItem",
    action: "destroy",
    name: "Destroy orders",
    description: "Allow to delete the orders."
  }
]

permission_seed.each do |permission_params|
  Permission.find_or_create_by(permission_params)
end

puts 'Done ...'
