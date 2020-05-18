# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name = Faker::Name.first_name
  email = "sample#{n+1}@sample.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               confirmed_at: Date.today)
  end

users = User.all
30.times do
  content = Faker::Food.sushi
  users.each { |user| user.microposts.create!(content: content) }
end
