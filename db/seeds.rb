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
Country.destroy_all

User.create(email: "whatevs@whatevs.com", password: "123456")

40.times do
  puts "Creating user..."
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    description: Faker::Twitter.status
  )
  user.save
  puts "User #{user.id} has been created."
end

# countries

COUNTRIES = [
  "Afghanistan",
  "Aland Islands",
  "Albania",
  "Algeria",
  "American Samoa",
  "Andorra",
  "Angola",
  "Anguilla",
  "Antarctica",
  "Antigua And Barbuda",
  "Argentina",
  "Armenia",
  "Aruba",
  "Australia",
  "Austria",
  "Azerbaijan",
  "Bahamas",
  "Bahrain",
  "Bangladesh",
  "Barbados",
  "Belarus",
  "Belgium",
  "Belize",
  "Benin",
  "Bermuda",
  "Bhutan",
  "Bolivia",
  "Bosnia and Herzegowina",
  "Botswana",
  "Bouvet Island",
  "Brazil",
  "British Indian Ocean Territory",
  "Brunei Darussalam",
  "Bulgaria",
  "Burkina Faso",
  "Burundi",
  "Cambodia",
  "Cameroon",
  "Canada",
  "Cape Verde",
  "Cayman Islands",
  "Central African Republic",
  "Chad",
  "Chile",
  "China",
  "Christmas Island",
  "Cocos (Keeling) Islands",
  "Colombia",
  "Comoros",
  "Congo",
  "Congo, the Democratic Republic of the",
  "Cook Islands",
  "Costa Rica",
  "Cote d'Ivoire",
  "Croatia",
  "Cuba",
  "Cyprus",
  "Czech Republic",
  "Denmark",
  "Djibouti",
  "Dominica",
  "Dominican Republic",
  "Ecuador",
  "Egypt",
  "El Salvador",
  "Equatorial Guinea",
  "Eritrea",
  "Estonia",
  "Ethiopia",
  "Falkland Islands (Malvinas)",
  "Faroe Islands",
  "Fiji",
  "Finland",
  "France",
  "French Guiana",
  "French Polynesia",
  "French Southern Territories",
  "Gabon",
  "Gambia",
  "Georgia",
  "Germany",
  "Ghana",
  "Gibraltar",
  "Greece",
  "Greenland",
  "Grenada",
  "Guadeloupe",
  "Guam",
  "Guatemala",
  "Guernsey",
  "Guinea",
  "Guinea-Bissau",
  "Guyana",
  "Haiti",
  "Heard and McDonald Islands",
  "Holy See (Vatican City State)",
  "Honduras",
  "Hong Kong",
  "Hungary",
  "Iceland",
  "India",
  "Indonesia",
  "Iran, Islamic Republic of",
  "Iraq",
  "Ireland",
  "Isle of Man",
  "Israel",
  "Italy",
  "Jamaica",
  "Japan",
  "Jersey",
  "Jordan",
  "Kazakhstan",
  "Kenya",
  "Kiribati",
  "Korea, Democratic People's Republic of",
  "Korea, Republic of",
  "Kuwait",
  "Kyrgyzstan",
  "Lao People's Democratic Republic",
  "Latvia",
  "Lebanon",
  "Lesotho",
  "Liberia",
  "Libyan Arab Jamahiriya",
  "Liechtenstein",
  "Lithuania",
  "Luxembourg",
  "Macao",
  "Macedonia, The Former Yugoslav Republic Of",
  "Madagascar",
  "Malawi",
  "Malaysia",
  "Maldives",
  "Mali",
  "Malta",
  "Marshall Islands",
  "Martinique",
  "Mauritania",
  "Mauritius",
  "Mayotte",
  "Mexico",
  "Micronesia, Federated States of",
  "Moldova, Republic of",
  "Monaco",
  "Mongolia",
  "Montenegro",
  "Montserrat",
  "Morocco",
  "Mozambique",
  "Myanmar",
  "Namibia",
  "Nauru",
  "Nepal",
  "Netherlands",
  "Netherlands Antilles",
  "New Caledonia",
  "New Zealand",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "Niue",
  "Norfolk Island",
  "Northern Mariana Islands",
  "Norway",
  "Oman",
  "Pakistan",
  "Palau",
  "Palestinian Territory, Occupied",
  "Panama",
  "Papua New Guinea",
  "Paraguay",
  "Peru",
  "Philippines",
  "Pitcairn",
  "Poland",
  "Portugal",
  "Puerto Rico",
  "Qatar",
  "Reunion",
  "Romania",
  "Russian Federation",
  "Rwanda",
  "Saint Barthelemy",
  "Saint Helena",
  "Saint Kitts and Nevis",
  "Saint Lucia",
  "Saint Pierre and Miquelon",
  "Saint Vincent and the Grenadines",
  "Samoa",
  "San Marino",
  "Sao Tome and Principe",
  "Saudi Arabia",
  "Senegal",
  "Serbia",
  "Seychelles",
  "Sierra Leone",
  "Singapore",
  "Slovakia",
  "Slovenia",
  "Solomon Islands",
  "Somalia",
  "South Africa",
  "South Georgia and the South Sandwich Islands",
  "Spain",
  "Sri Lanka",
  "Sudan",
  "Suriname",
  "Svalbard and Jan Mayen",
  "Swaziland",
  "Sweden",
  "Switzerland",
  "Syrian Arab Republic",
  "Taiwan, Province of China",
  "Tajikistan",
  "Tanzania, United Republic of",
  "Thailand",
  "Timor-Leste",
  "Togo",
  "Tokelau",
  "Tonga",
  "Trinidad and Tobago",
  "Tunisia",
  "Turkey",
  "Turkmenistan",
  "Turks and Caicos Islands",
  "Tuvalu",
  "Uganda",
  "Ukraine",
  "United Arab Emirates",
  "United Kingdom",
  "United States",
  "United States Minor Outlying Islands",
  "Uruguay",
  "Uzbekistan",
  "Vanuatu",
  "Venezuela",
  "Viet Nam",
  "Virgin Islands, British",
  "Virgin Islands, U.S.",
  "Wallis and Futuna",
  "Western Sahara",
  "Yemen",
  "Zambia",
  "Zimbabwe"
]

puts "Creating countries..."

COUNTRIES.each do |country|
  Country.create(name: country)
end

puts "Done! #{Country.count} countries created!"

# itineraries

puts "Creating itineraries..."

itin1 = Itinerary.create(
    title: "Colombia Coast",
    description: "Discover the Colombian Caribbean!",
    user: User.all.sample
  )

country_itinerary1 = CountryItinerary.new
country_itinerary1.itinerary = itin1
country_itinerary1.country = Country.find_by(name: "Colombia")
country_itinerary1.save!

3.times do |i|
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
    day.itinerary = itin1
    day.save!
    puts "Day #{day.id} has been created."

    puts "Creating booking..."
    booking = Booking.new
    booking.user = User.all.sample
    booking.itinerary = itin1
    booking.save!
    puts "Booking #{booking.id} has been created."
  end

  itin2 = Itinerary.create(
    title: "Magical Peru",
    description: "Discover the beauties of Peru!",
    user: User.all.sample
  )

country_itinerary2 = CountryItinerary.new
country_itinerary2.itinerary = itin2
country_itinerary2.country = Country.find_by(name: "Peru")
country_itinerary2.save!

  3.times do |i|
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
    day.itinerary = itin2
    day.save!
    puts "Day #{day.id} has been created."
  end

  itin3 = Itinerary.create(
    title: "Wine in Provence",
    description: "Tour of the best wineries in Provence!",
    user: User.all.sample
  )

country_itinerary3 = CountryItinerary.new
country_itinerary3.itinerary = itin3
country_itinerary3.country = Country.find_by(name: "France")
country_itinerary3.save!

  3.times do |i|
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
    day.itinerary = itin3
    day.save!
    puts "Day #{day.id} has been created."
    puts "Creating booking..."
    booking = Booking.new
    booking.user = User.all.sample
    booking.itinerary = itin3
    booking.save!
    puts "Booking #{booking.id} has been created."
  end

  itin4 = Itinerary.create(
    title: "Oaxaca City Food Markets",
    description: "The perfect guide for surrounding village markets in Oaxaca, MX!",
    user: User.all.sample
  )

country_itinerary4 = CountryItinerary.new
country_itinerary4.itinerary = itin4
country_itinerary4.country = Country.find_by(name: "Mexico")
country_itinerary4.save!

  3.times do |i|
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
    day.itinerary = itin4
    day.save!
    puts "Day #{day.id} has been created."

    puts "Creating booking..."
    booking = Booking.new
    booking.user = User.all.sample
    booking.itinerary = itin4
    booking.save!
    puts "Booking #{booking.id} has been created."
  end

  itin5 = Itinerary.create(
    title: "Barcelona on fire!",
    description: "Discover the hidden gems of the popular party capital of Europe!",
    user: User.all.sample
  )

country_itinerary5 = CountryItinerary.new
country_itinerary5.itinerary = itin5
country_itinerary5.country = Country.find_by(name: "Spain")
country_itinerary5.save!

  3.times do |i|
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
    day.itinerary = itin5
    day.save!
    puts "Day #{day.id} has been created."
  end

  itin6 = Itinerary.create(
    title: "Chiapas Jungle",
    description: "Get an authentic experience from Chiapas!",
    user: User.all.sample
  )

country_itinerary6 = CountryItinerary.new
country_itinerary6.itinerary = itin6
country_itinerary6.country = Country.find_by(name: "Mexico")
country_itinerary6.save!


  3.times do |i|
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
    day.itinerary = itin6
    day.save!
    puts "Day #{day.id} has been created."
  end

itin7 = Itinerary.create(
  title: "Ultimate Guide to Czech Beer",
  description: "Discover the authentic taste of Czech breweries.",
  user: User.all.sample
  # right now, we are selecting just one country
)

country_itinerary7 = CountryItinerary.new
country_itinerary7.itinerary = itin7
country_itinerary7.country = Country.find_by(name: "Czech Republic")
country_itinerary7.save!

  3.times do |i|
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
    day.itinerary = itin7
    day.save!
    puts "Day #{day.id} has been created."
  end

  itin8 = Itinerary.create(
    title: "Surroundings of Medellin",
    description: "Discover the infamous city of Pablo Escobar!",
    user: User.all.sample
  )

country_itinerary8 = CountryItinerary.new
country_itinerary8.itinerary = itin8
country_itinerary8.country = Country.find_by(name: "Colombia")
country_itinerary8.save!

  3.times do |i|
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
    day.itinerary = itin8
    day.save!
    puts "Day #{day.id} has been created."
  end

  itin9 = Itinerary.create(
    title: "Mexico City Streetfood Tour",
    description: "Learn where to get the best tacos de pastor in CDMX!",
    user: User.all.sample
  )

country_itinerary9 = CountryItinerary.new
country_itinerary9.itinerary = itin9
country_itinerary9.country = Country.find_by(name: "Mexico")
country_itinerary9.save!

  3.times do |i|
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
    day.itinerary = itin9
    day.save!
    puts "Day #{day.id} has been created."
  end

  itin10 = Itinerary.create(
    title: "Hitchhike in Portugal!",
    description: "The ultimate guide for backpackers in Portugal!",
    user: User.all.sample
  )

country_itinerary10 = CountryItinerary.new
country_itinerary10.itinerary = itin10
country_itinerary10.country = Country.find_by(name: "Portugal")
country_itinerary10.save!

    3.times do |i|
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
    day.itinerary = itin10
    day.save!
    puts "Day #{day.id} has been created."

    puts "Creating booking..."
    booking = Booking.new
    booking.user = User.all.sample
    booking.itinerary = itin10
    booking.save!
    puts "Booking #{booking.id} has been created."
  end

  puts "Created #{Itinerary.count} itineraries..."
  puts "Created #{CountryItinerary.count} country_itineraries..."

puts "Finished!"
