# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding . . . "
10.times do 
    User.create(name: Faker::Name.name, location: Faker::Address.city, address: Faker::Address.street_address, zip_code: Faker::Address.zip, phone_number: rand(1111111111..9999999999), email: Faker::Internet.email, password_digest: "test")
end

10.times do 
    Post.create(user_id: User.ids.sample, title: Faker::GreekPhilosophers.quote, category: Post.categories.sample, price: rand(0.01..99.99), desc: Faker::Hacker.say_something_smart)
end

10.times do 
    Comment.create(user_id: User.ids.sample, post_id: Post.ids.sample, content: Faker::ChuckNorris.fact )
end

puts "done."