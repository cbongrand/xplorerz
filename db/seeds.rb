# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Replace with more users if required
puts "Cleaning database..."
Booking.destroy_all
Itinerary.destroy_all
User.destroy_all

User.create(email: "whatevs@whatevs.com", password: "123456")

puts "Creating dummy itineraries..."
4.times do |x|
  itin = Itinerary.create(title: "Test itinerary #{x + 1}",
                          description: "This is a test", user: User.first)
  puts "Creating days..."

  4.times do |i|
    day = Day.new(
      order: i + 1,
      city: Faker::Address.city,
      description: Faker::Lorem.sentence,
      restaurant_info: Faker::Restaurant.name,
      activity_info: Faker::Hobby.activity,
      extra_info: Faker::Games::WorldOfWarcraft.quote,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
    )
    day.itinerary = itin
    day.save!
    puts "Day #{day.id} has been created."

    puts "creating user..."
    user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: '123456',
      description: Faker::Twitter.status,
    )
    puts "User #{user.id} has been created."
    puts "creating booking..."
    booking = Booking.new
    booking.user = user
    booking.itinerary = itin
    booking.save!
    puts "Booking #{booking.id} has been created."
  end
end

puts "Creating countries..."
4.times do
  country = Country.new(
    name: Faker::Address.country
  )
  country.save!
end
puts "Done!"


puts "Finished!"
