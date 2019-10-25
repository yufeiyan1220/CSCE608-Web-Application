# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
  name  = Faker::Name.unique.name
  email = "example-#{n+1}@database608.com"
  country = Faker::Nation.nationality
  state = "#{country}.STATE"
  User.create!(name: name, 
              email: email, 
              country: country, 
              state: state
             )
             
 end
 
platforms = ["Android", "IOS", "PS4", "XBOX", "NS", "Windows", "Linux", "Mac_OS"]
versions = ["10.0", "11.0", "v3", "4.2", "1.3","10","16.04","11.0"]

for i in 0...7
    Platform.create!({name: platforms[i], version: versions[i]})
end
             

10.times do |n|
  name  = Faker::Company.unique.name
  country = Faker::Nation.nationality
  emplyees = rand(1...10000)
  Company.create!(name: name, 
              country: country, 
              number_employee: emplyees
             )
end