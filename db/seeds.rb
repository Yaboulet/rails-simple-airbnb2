# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Create Users
10.times do |n|
  email = "test#{n + 1}@gmail.com"
  User.create!(
    email: email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number
  )
end


# Create Flats associated with Users
User.all.each do |user|
  5.times do
    user.flats.create!(
      name: Faker::Address.community,
      address: Faker::Address.full_address,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      price_per_night: Faker::Number.between(from: 50, to: 300),
      number_of_guests: Faker::Number.between(from: 1, to: 6)
    )
  end
end
