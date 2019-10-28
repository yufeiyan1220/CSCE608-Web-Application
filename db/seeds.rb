# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#init users
100.times do |n|
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
#init platforms, versions, and app_types
platforms = ["Android", "IOS", "PS4", "XBOX", "NS", "Windows", "Linux", "Mac_OS"]
versions = ["10.0", "11.0", "v3", "4.2", "1.3","10","16.04","11.0"]
app_types = ["Game","Social Network","Travel","Payment","Streamer","Music Player","Video Player","Office"]

for i in 0...7
    Platform.create!({name: platforms[i], version: versions[i]})
end
             
#init company
10.times do |n|
  name  = Faker::Company.unique.name
  country = Faker::Nation.nationality
  emplyees = rand(1...10000)
  Company.create!(name: name, 
              country: country, 
              number_employee: emplyees
             )
end

#init app
500.times do |n|
  name  = Faker::App.name
  version = Faker::App.version
  app_type = app_types.sample
  
  company = Company.all.sample
  app_platforms = Platform.all.sample(rand(1..7))
  
  cur_app = App.create(name: name, 
              version: version, 
              app_type: app_type,
              company_id: company.id
            )
  cur_app.platforms = app_platforms
end

User.all.each do |user|
  
  ids = App.pluck(:id).sample(rand(1..10))
  ids.each do |id|
    #purchase items
    PurchaseItem.create(used_times: rand(0..100),
                price: rand(1..100),
                app_id: id,
                user_id: user.id
      )
    # add reviews
    Review.create(user_id: user.id,
                app_id: id,
                star: rand(1..5),
                comment: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)
      )
  end
  
end


