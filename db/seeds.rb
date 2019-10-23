# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@database608.com"
  country = "CC"
  state = "CC.STATE"
  User.create!(name: name, 
              email: email, 
              country: country, 
              state: state
             )
             
 end
 
 
 20.times do |n|
  name  = Faker::App.unique.name
  email = "example-#{n+1}@database608.com"
  country = "CC"
  state = "CC.STATE"
  User.create!(name: name, 
              email: email, 
              country: country, 
              state: state
             )
             
 end