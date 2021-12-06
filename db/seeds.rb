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

i = 0

day1 = Day.new(
  order: i + 1,
  city: "Cartagena",
  description: "Start your Colombia adventure in the famous colonial city of Cartagena",
  restaurant_info: "Buena Vida - Marisqueria, Centro histórico, Cl. del Porvenir #Esquina, Cartagena de Indias, Bolívar, Colombia",
  activity_info: 'Take a walk in the historic centre, have a drink at the terrace with overview over the sea.',
  extra_info: 'For accommodation, you can check Soy Local, Cartagena: https://hotelink.app/Soy-Local-Cartagena-Colombia. They offer from rooms, to apartments, with a rooftop terrace and a tiny pool.',
  latitude: '10.3932° N',
  longitude: '75.4832° W'
)
day1.itinerary = itin1
day1.save!
puts "Day #{day1.id} has been created."

day2 = Day.new(
  order: i + 1,
  city: "Cartagena - Islas Rosarias",
  description: "Take your Colombian adventure to a next level by booking a stay at a private island of Islas Rosarias.",
  restaurant_info: "You can book Casa Eden along with its incredible meals that include e.g. Arepas de huevo & fresh juice for breakfast.",
  activity_info: 'Casa Eden has direct entrance to the sea (private beach), in addition, you can ask for renting a kayak or visit the local coral reef.',
  extra_info: 'Find Casa Eden at https://www.booking.com/hotel/co/casa-eden-oceanario-islas-del-rosario.es.html?auth_success=1. Boats for Islas Rosarias leave from the main ferry point, tier 2.',
  latitude: '10.3932° N',
  longitude: '75.4832° W'
)
day2.itinerary = itin1
day2.save!
puts "Day #{day2.id} has been created."

day3 = Day.new(
  order: i + 1,
  city: "Cartagena - Islas Rosarias",
  description: "Spend the next day on the Isla mayor (Papaya), where you get another gist of the Caribbean paradise. Return to Cartagena in the evening.",
  restaurant_info: "You can get a local fish at the Papaya island. On return to  Cartagena, dine in Restaurante Celele",
  activity_info: 'You will get to experience a different side of the Caribbean, one that begs in for a glass of rum and coke.',
  extra_info: 'Cartagena is known for its amazing nighlife - give a go to the infamous bar Alquimico!',
  latitude: '10.3932° N',
  longitude: '75.4832° W'
)
day3.itinerary = itin1
day3.save!
puts "Day #{day3.id} has been created."

day4 = Day.new(
  order: i + 1,
  city: "Santa Marta",
  description: "Leave to the less famous Santa Marta that is just 4 hours away from Cartagena.",
  restaurant_info: "For amazing breakfast visit the local Arte Sano café, next to the Parque Bolívar.",
  activity_info: 'Head to the local Marina where you can rest a private boat which takes you to the best bathing spots in Santa Marta.',
  extra_info: 'The private boat will also take you to have a lunch at Playa Blanca, where you can enjoy the fresh fish!',
  latitude: '11.2404° N',
  longitude: '74.2110° W'
)
day4.itinerary = itin1
day4.save!
puts "Day #{day4.id} has been created."

3.times do
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

i = 0
day = Day.new(
  order: i + 1,
  city: "Lima",
  description: "Start your journey in the Peruvian capital.",
  restaurant_info: "Try the infamous La Picanteria for the local ceviche!",
  activity_info: "Spend your afternoon on a food tour & discovering the historical centre.",
  extra_info: "Rather than spending a night, book a night bus to Ica - the buses are confortable and adapted for a good sleep!",
  latitude: '12.0464° S',
  longitude: '77.0428° W'
)
day.itinerary = itin2
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Ica",
  description: "Upon your arrival to Ica, head to the oasis of Huacachina in the middle of the desert!",
  restaurant_info: "Get some arroz con mariscos upon your arrival to Huacachina!",
  activity_info: "Don't hesitate to immerge yourself in the sandboarding experience in the desert!",
  extra_info: "The best transportation from Ica to Huacachina are the local Tuktuks",
  latitude: '14.0755° S',
  longitude: '75.7342° W'
)
day.itinerary = itin2
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Arequipa",
  description: "Take an early morning bus to the white city of Arequipa!",
  restaurant_info: "Definitely take the chance to try some manjar - the local specialty! Get some crepes with Manjar in the French Alliance in the historic centre.",
  activity_info: "The historic centre is worth spending a day exploring.",
  extra_info: "There is also a small llama farm in the city centre, where you can buy your fairtrade Alpaca sweaters as well as feed the llamas!",
  latitude: '16°23′56" S',
  longitude: '71°32′05" W'
)
day.itinerary = itin2
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Arequipa - Lagunas Salidas",
  description: "Spend the day in magical salt lakes near Arequipa!",
  restaurant_info: "Recommended to take some snacks with you as the salt lakes are pretty far from any civilisation. Possibly, you can ask your driver to stop in a local restaurant.",
  activity_info: "Salt lakes don't only offer amazing scenic views, but are also rich on local wildlife such as wild llamas and flamencos.",
  extra_info: "Be prepared for natural thermal baths as well as the high altitude (around 5k)",
  latitude: '16°23′56" S',
  longitude: '71°32′05" W'
)
day.itinerary = itin2
day.save!
puts "Day #{day.id} has been created."

itin3 = Itinerary.create(
  title: "Wine in Provence",
  description: "Tour of the best wineries in Provence!",
  user: User.all.sample
)

country_itinerary3 = CountryItinerary.new
country_itinerary3.itinerary = itin3
country_itinerary3.country = Country.find_by(name: "France")
country_itinerary3.save!

i = 0

day = Day.new(
  order: i + 1,
  city: "Avignon",
  description: "Start in the historic gem of Avignon - the city of the fallen brigde",
  restaurant_info: "Kick off your wine tasting experience in the small bar Le Vin devant Soi",
  activity_info: 'Visit the famous bridge and Avignon castle',
  extra_info: "Don't forget to walk around and visit the small markets of Provence",
  latitude: "43.9493° N",
  longitude: "4.8055° E"
)
day.itinerary = itin3
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Châteauneuf-du-Pape",
  description: "Book a tour to the infamous wine region of Château-neuf-du-Pape",
  restaurant_info: "Ask your driver to take you to the historic summer castle of the Popes - you can find nice restaurants there with a terrace!",
  activity_info: 'You will degustate in 5 wineries, from aged reds to delicate whites',
  extra_info: "Despite the region being famous for exportation of red wines, few people know that their white wines are more than equally good. Get some sent to your home country!",
  latitude: "44.0566° N",
  longitude: "4.8313° E"
)
day.itinerary = itin3
day.save!
puts "Day #{day.id} has been created."

5.times do
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

i = 0
day = Day.new(
  order: i + 1,
  city: "Oaxaca de Juarez",
  description: "On your first day, book a tour by @oaxacking",
  restaurant_info: "Omar will take you to all the local markets of the capital of Oaxaca",
  activity_info: "You will explore the best of Oaxaca cuisine - the first cuisine to have been awarded UNESCO protection!",
  extra_info: "Visit a local Mezcal tasting as well!",
  latitude: '17.0732° N',
  longitude: '96.7266° W'
)
day.itinerary = itin4
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Oaxaca de Juarez - Ocotlán de Morelos",
  description: "On Monday, go to Ocotlán de Morelos",
  restaurant_info: "Try the local barbacoa",
  activity_info: "On Monday, all local artesanías sellers move to Ocotlán de Morelos",
  extra_info: "Taxi costs around $40 one way and leaves from C. Porfirio Díaz",
  latitude: '17.0732° N',
  longitude: '96.7266° W'
)
day.itinerary = itin4
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Oaxaca de Juarez - Zaachila",
  description: "On Tuesday, go to Zaachila",
  restaurant_info: "Try the local pulque",
  activity_info: "On Tuesday, all local artesanías sellers move to Zaachila",
  extra_info: "Taxi costs around $40 one way and leaves from C. Porfirio Díaz",
  latitude: '17.0732° N',
  longitude: '96.7266° W'
)
day.itinerary = itin4
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Oaxaca de Juarez - Santa María Atzompa",
  description: "On Wednesday, go to Santa María Atzompa. You can also visit local ruins here.",
  restaurant_info: "Try the local mezcal",
  activity_info: "On Wednesday, all local artesanías sellers move to Santa María Atzompa",
  extra_info: "Taxi costs around $40 one way and leaves from C. Porfirio Díaz",
  latitude: '17.0732° N',
  longitude: '96.7266° W'
)
day.itinerary = itin4
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Oaxaca de Juarez - San Bartolo Coyotepec",
  description: "On Thursday, go to San Bartolo Coyotepec. You can also visit the local temple",
  restaurant_info: "Try the local marmelita de huitlacoche",
  activity_info: "On Thursday, all local artesanías sellers move to San Bartolo Coyotepec",
  extra_info: "Taxi costs around $40 one way and leaves from C. Porfirio Díaz",
  latitude: '17.0732° N',
  longitude: '96.7266° W'
)
day.itinerary = itin4
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Oaxaca de Juarez - Cuilápam de Guerrero",
  description: "On Friday, go to Cuilápam de Guerrero.",
  restaurant_info: "Try the local chapulines with chille & lime",
  activity_info: "On Friday, all local artesanías sellers move to Cuilápam de Guerrero",
  extra_info: "Taxi costs around $40 one way and leaves from C. Porfirio Díaz",
  latitude: '17.0732° N',
  longitude: '96.7266° W'
)
day.itinerary = itin4
day.save!
puts "Day #{day.id} has been created."

7.times do
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

i = 0
day = Day.new(
  order: i + 1,
  city: "Barcelona",
  description: "Spend your first day in the magical Gotico neighbourhood!",
  restaurant_info: "Get your lunch in the Mexican Rosa Negra",
  activity_info: "Visit the Barcelona cathedral and enjoy the stunning view over Barcelona.",
  extra_info: "At night, visit Le Bonbon for salsa!",
  latitude: "41.3874° N",
  longitude: "2.1686° E"
)
day.itinerary = itin5
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Barcelona",
  description: "On your second day, head to the northern Les Corts & Grazia!",
  restaurant_info: "Get your lunch in the upbeat Grazia neighbourhood near La Fontana. Head to Parallelo for a delicious ice cream!",
  activity_info: "Visit the Cervantes park in the morning. Head to Mirador d'Horta for some stunning views from the other side!",
  extra_info: "In Grazia neighbourhood, get some alfajores in chocolate or empanadas to enjoy a picnic later in d'Horta!",
  latitude: "41.3874° N",
  longitude: "2.1686° E"
)
day.itinerary = itin5
day.save!
puts "Day #{day.id} has been created."

day = Day.new(
  order: i + 1,
  city: "Barcelona",
  description: "On your third day, head to Sants and Montjuic!",
  restaurant_info: "Get your lunch in Bronzo - special recommendations go to cheese & truffle pizza",
  activity_info: "See the parc d'Espanya Industriel in the morning and climb from Poble Sec to Montjuic for the sunset!",
  extra_info: "Don't forget to check the current exhibition in Palau Robert, next to Bronzo! Take some vermuth in Carrer del Bruc as well!",
  latitude: "41.3874° N",
  longitude: "2.1686° E"
)
day.itinerary = itin5
day.save!
puts "Day #{day.id} has been created."

itin6 = Itinerary.create(
  title: "Chiapas Jungle",
  description: "Get an authentic experience from Chiapas!",
  user: User.all.sample
)

country_itinerary6 = CountryItinerary.new
country_itinerary6.itinerary = itin6
country_itinerary6.country = Country.find_by(name: "Mexico")
country_itinerary6.save!

i = 0

# resume here

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
