puts 'Cleaning the DB...'
Restaurant.destroy_all
puts 'DB is clean!'

puts 'Creating 50 restaurants...'

50.times do
  restaurant = Restaurant.create!(
    name: Faker::Games::Pokemon.name,
    address: Faker::Fantasy::Tolkien.location,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORY.sample
  )
  3.times do
    review = Review.create!(
      rating: rand(1..5),
      content: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
      restaurant_id: restaurant.id
    )
    review.save!
  end
  restaurant.save!
end
puts 'done!'
