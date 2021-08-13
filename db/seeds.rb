# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting previous data ... posts, comments, users"
Post.destroy_all
Comment.destroy_all
User.destroy_all

puts "seeding . . . "
10.times do 
    User.create(name: Faker::Name.name, location: Faker::Address.city, address: Faker::Address.street_address, zip_code: Faker::Address.zip, phone_number: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, password_digest: "test")
end

Post.create(user_id: User.ids.sample, title: "Brown couch looking for new home!", category: "Furniture", price: rand(0.01..99.99).round(2), desc: "Leave a comment if you're interested. I will reach out to discuss details.")
Post.create(user_id: User.ids.sample, title: "Unused pink lamp", category: "Furniture", price: rand(0.01..99.99).round(2), desc: "Condition is still new.")
Post.create(user_id: User.ids.sample, title: "Chemistry textbooks need new owners", category: "Books", price: rand(0.01..99.99).round(2), desc: "Hi everyone! I have a 4-5 chemistry textbooks that I no longer need. Reach out to me for more details!")
Post.create(user_id: User.ids.sample, title: "Looking to give away some clothes", category: "Other", price: rand(0.01..99.99).round(2), desc: "I have a lot of clothes and my closet is running out of room. Happy to give these away for free.")


Comment.create(user_id: User.ids.sample, post_id: Post.ids.sample, content: "I'm interested!" )
Comment.create(user_id: User.ids.sample, post_id: Post.ids.sample, content: "Has someone already claimed this?" )
Comment.create(user_id: User.ids.sample, post_id: Post.ids.sample, content: "Am interested, happy to discuss costs!" )
Comment.create(user_id: User.ids.sample, post_id: Post.ids.sample, content: "I'm interested." )

puts "done."
