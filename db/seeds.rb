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
#             password_confirmation: 'password', admin: true}
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
    subject_class: "Table",
    action: "read",
    name: "Show all tables",
    description: "Allow user to see all tables."
  },
  {
    subject_class: "Table",
    action: "create",
    name: "Add new tables",
    description: "Allow user to add tables."
  },
  {
    subject_class: "Table",
    action: "update",
    name: "Update tables",
    description: "Allow user to update information about tables."
  },
  {
    subject_class: "Table",
    action: "destroy",
    name: "Destroy tables",
    description: "Allow user to delete tables."
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
    subject_class: "OrderItem",
    action: "update",
    name: "Update dashboard order items",
    description: "Allows the staff member to work with orders."
  },
  {
    subject_class: "OrderItem",
    action: "read",
    name: "See restaurant orders",
    description: "Allows the staff member to work with orders."
  },
  {
    subject_class: "Order",
    action: "read",
    name: "See whole order",
    description: "Allows the staff member to work with orders."
  },
  {
    subject_class: "Order",
    action: "update",
    name: "Update all order",
    description: "Allows the staff member to work with orders."
  }
]

permission_seed.each do |permission_params|
  Permission.find_or_create_by(permission_params)
end

puts 'Done ...'
