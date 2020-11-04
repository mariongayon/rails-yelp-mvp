# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Restaurant.destroy_all
Review.destroy_all

puts "Creating restaurants..."

5.times do
  rest = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  )

  puts "Created #{rest.name}"

  puts 'Creating reviews'

  5.times do
    Review.create!(
      restaurant: rest,
      rating: rand(1..5),
      content: Faker::Restaurant.review
    )
  end
puts "Finished!"
end
