# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying records"

Restaurant.destroy_all

puts "Creating Restaurants"

10.times do
  resto = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  puts "Created #{resto.name}"
end

Restaurant.all.each do |restaurant|
  10.times do
    Review.create!(content: Faker::Restaurant.review, rating: rand(0..5), restaurant_id: restaurant.id)
  end
end

puts "Created #{Restaurant.count} restaurants"
