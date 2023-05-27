# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

12.times do
  # Generate fake data for each attribute
  name = Faker::Address.community
  address = Faker::Address.full_address
  description = Faker::Lorem.paragraph(sentence_count: 3)
  price_per_night = Faker::Number.between(from: 50, to: 300)
  number_of_guests = Faker::Number.between(from: 1, to: 6)

  # Create a Flat instance using the generated data
  Flat.create!(
    name: name,
    address: address,
    description: description,
    price_per_night: price_per_night,
    number_of_guests: number_of_guests
  )
end
