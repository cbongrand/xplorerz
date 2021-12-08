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

5.times do
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

# tags

TAGS = [
  "Adventure",
  "Nature",
  "Surf",
  "Food",
  "Nature-friendly",
  "Sports",
  "Hiking",
  "City",
  "Animals",
  "Family",
  "Tropical",
  "Beach",
  "Snow",
  "Forest",
  "National Park"
]

COLORS = [
  '#FF6633', '#FFB399', '#FF33FF', '#FFFF99', '#00B3E6',
  '#E6B333', '#3366E6', '#999966', '#99FF99', '#B34D4D',
  '#80B300', '#809900', '#E6B3B3', '#6680B3', '#66991A',
  '#FF99E6', '#CCFF1A', '#FF1A66', '#E6331A', '#33FFCC',
  '#66994D', '#B366CC', '#4D8000', '#B33300', '#CC80CC',
  '#66664D', '#991AFF', '#E666FF', '#4DB3FF', '#1AB399',
  '#E666B3', '#33991A', '#CC9999', '#B3B31A', '#00E680',
  '#4D8066', '#809980', '#E6FF80', '#1AFF33', '#999933',
  '#FF3380', '#CCCC00', '#66E64D', '#4D80CC', '#9900B3',
  '#E64D66', '#4DB380', '#FF4D4D', '#99E6E6', '#6666FF'
]

puts "Creating tags..."

TAGS.each do |tag|
  Tag.create(
    name: tag,
    color: COLORS.sample
  )
end

puts "Done! #{Tag.count} tags created!"

# countries

COUNTRIES = [
  "Afghanistan 🇦🇫",
  "Aland Islands 🇦🇽",
  "Albania 🇦🇱",
  "Algeria 🇩🇿",
  "American Samoa 🇦🇸",
  "Andorra 🇦🇩",
  "Angola 🇦🇴",
  "Anguilla 🇦🇮",
  "Antarctica 🇦🇶",
  "Antigua And Barbuda 🇦🇬",
  "Argentina 🇦🇷",
  "Armenia 🇦🇲",
  "Aruba 🇦🇼",
  "Australia 🇦🇺",
  "Austria 🇦🇹",
  "Azerbaijan 🇦🇿",
  "Bahamas 🇧🇸",
  "Bahrain 🇧🇭",
  "Bangladesh 🇧🇩",
  "Barbados 🇧🇧",
  "Belarus 🇧🇾",
  "Belgium 🇧🇪",
  "Belize 🇧🇿",
  "Benin 🇧🇯",
  "Bermuda 🇧🇲",
  "Bhutan 🇧🇹",
  "Bolivia 🇧🇴",
  "Bosnia and Herzegowina 🇧🇦",
  "Brazil 🇧🇷",
  "Brunei 🇧🇳",
  "Bulgaria 🇧🇬",
  "Burkina Faso 🇧🇫",
  "Burundi 🇧🇮",
  "Cambodia 🇰🇭",
  "Cameroon 🇨🇲",
  "Canada 🇨🇦",
  "Cape Verde 🇨🇻",
  "Cayman Islands 🇰🇾",
  "Central African Republic 🇨🇫",
  "Chile 🇨🇱",
  "China 🇨🇳",
  "Colombia 🇨🇴",
  "Comoros 🇰🇲",
  "Congo 🇨🇬",
  "Cook Islands 🇨🇰",
  "Costa Rica 🇨🇷",
  "Cote d'Ivoire 🇨🇮",
  "Croatia 🇭🇷",
  "Cuba 🇨🇺",
  "Cyprus 🇨🇾",
  "Czech Republic 🇨🇿",
  "Denmark 🇩🇰",
  "Djibouti 🇩🇯",
  "Dominican Republic 🇩🇴",
  "Ecuador 🇪🇨",
  "Egypt 🇪🇬",
  "El Salvador 🇸🇻",
  "Equatorial Guinea 🇬🇶",
  "Eritrea 🇪🇷",
  "Estonia 🇪🇪",
  "Ethiopia 🇪🇹",
  "Faroe Islands 🇫🇴",
  "Fiji 🇫🇯",
  "Finland 🇫🇮",
  "France 🇫🇷",
  "French Guiana 🇬🇫",
  "French Polynesia 🇵🇫",
  "Gabon 🇬🇦",
  "Gambia 🇬🇲",
  "Georgia 🇬🇪",
  "Germany 🇩🇪",
  "Ghana 🇬🇭",
  "Gibraltar 🇬🇮",
  "Greece 🇬🇷",
  "Greenland 🇬🇱",
  "Grenada 🇬🇩",
  "Guadeloupe 🇬🇵",
  "Guam 🇬🇺",
  "Guatemala 🇬🇹",
  "Guernsey 🇬🇬",
  "Guinea 🇬🇳",
  "Guinea-Bissau 🇬🇼",
  "Guyana 🇬🇾",
  "Haiti 🇭🇹",
  "Vatican 🇻🇦",
  "Honduras 🇭🇳",
  "Hong Kong 🇭🇰",
  "Hungary 🇭🇺",
  "Iceland 🇮🇸",
  "India 🇮🇳",
  "Indonesia 🇮🇩",
  "Iran 🇮🇷",
  "Iraq 🇮🇶",
  "Ireland 🇮🇪",
  "Isle of Man 🇮🇲",
  "Israel 🇮🇱",
  "Italy 🇮🇹",
  "Jamaica 🇯🇲",
  "Japan 🇯🇵",
  "Jersey 🇯🇪",
  "Jordan 🇯🇴",
  "Kazakhstan 🇰🇿",
  "Kenya 🇰🇪",
  "Kiribati 🇰🇮",
  "South Korea 🇰🇷",
  "North Korea 🇰🇵",
  "Kuwait 🇰🇼",
  "Kyrgyzstan 🇰🇬",
  "Laos 🇱🇦",
  "Latvia 🇱🇻",
  "Lebanon 🇱🇧",
  "Lesotho 🇱🇸",
  "Liberia 🇱🇷",
  "Libya 🇱🇾",
  "Liechtenstein 🇱🇮",
  "Lithuania 🇱🇹",
  "Luxembourg 🇱🇺",
  "Macao 🇲🇴",
  "Madagascar 🇲🇬",
  "Malawi 🇲🇼",
  "Malaysia 🇲🇾",
  "Maldives 🇲🇻",
  "Mali 🇲🇱",
  "Malta 🇲🇹",
  "Marshall Islands 🇲🇭",
  "Martinique 🇲🇶",
  "Mauritania 🇲🇷",
  "Mauritius 🇲🇺",
  "Mayotte 🇾🇹",
  "Mexico 🇲🇽",
  "Moldova 🇲🇩",
  "Monaco 🇲🇨",
  "Mongolia 🇲🇳",
  "Montenegro 🇲🇪",
  "Morocco 🇲🇦",
  "Mozambique 🇲🇿",
  "Myanmar 🇲🇲",
  "Namibia 🇳🇦",
  "Nauru 🇳🇷",
  "Nepal 🇳🇵",
  "Netherlands 🇳🇱",
  "New Caledonia 🇳🇨",
  "New Zealand 🇳🇿",
  "Nicaragua 🇳🇮",
  "Niger 🇳🇪",
  "Nigeria 🇳🇬",
  "Niue 🇳🇺",
  "Norfolk Island 🇳🇫",
  "Northern Mariana Islands 🇲🇵",
  "Norway 🇳🇴",
  "Oman 🇴🇲",
  "Pakistan 🇵🇰",
  "Palau 🇵🇼",
  "Palestinian Territories 🇵🇸",
  "Panama 🇵🇦",
  "Papua New Guinea 🇵🇬",
  "Paraguay 🇵🇾",
  "Peru 🇵🇪",
  "Philippines 🇵🇭",
  "Poland 🇵🇱",
  "Portugal 🇵🇹",
  "Puerto Rico 🇵🇷",
  "Qatar 🇶🇦",
  "Reunion 🇷🇪",
  "Romania 🇷🇴",
  "Russia 🇷🇺",
  "Rwanda 🇷🇼",
  "Saudi Arabia 🇸🇦",
  "Senegal 🇸🇳",
  "Serbia 🇷🇸",
  "Seychelles 🇸🇨",
  "Sierra Leone 🇸🇱",
  "Singapore 🇸🇬",
  "Slovakia 🇸🇰",
  "Slovenia 🇸🇮",
  "Solomon Islands 🇸🇧",
  "Somalia 🇸🇴",
  "South Africa 🇿🇦",
  "Spain 🇪🇸",
  "Sri Lanka 🇱🇰",
  "St. Barthélemy 🇧🇱",
  "St. Lucia 🇱🇨",
  "Sudan 🇸🇩",
  "Suriname 🇸🇷",
  "Sweden 🇸🇪",
  "Switzerland 🇨🇭",
  "Syria 🇸🇾",
  "Taiwan 🇹🇼",
  "Tajikistan 🇹🇯",
  "Tanzania 🇹🇿",
  "Thailand 🇹🇭",
  "Timor-Leste 🇹🇱",
  "Togo 🇹🇬",
  "Tokelau 🇹🇰",
  "Tonga 🇹🇴",
  "Trinidad and Tobago 🇹🇹",
  "Tunisia 🇹🇳",
  "Turkey 🇹🇷",
  "Turkmenistan 🇹🇲",
  "Turks and Caicos Islands 🇹🇨",
  "Tuvalu 🇹🇻",
  "Uganda 🇺🇬",
  "Ukraine 🇺🇦",
  "United Arab Emirates 🇦🇪",
  "United Kingdom 🇬🇧",
  "United States 🇺🇸",
  "Uruguay 🇺🇾",
  "Uzbekistan 🇺🇿",
  "Vanuatu 🇻🇺",
  "Venezuela 🇻🇪",
  "Viet Nam 🇻🇳",
  "Wallis and Futuna 🇼🇫",
  "Western Sahara 🇪🇭",
  "Yemen 🇾🇪",
  "Zambia 🇿🇲",
  "Zimbabwe 🇿🇼"
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
  description: "The Caribbean Coast is the first region that showed the beauty of Colombia to the world with the golden walls of the old city center in Cartagena, the sultry Bachata movements in small bars, the white sandy beaches of Rosario islands and the green maze of Tayrona National Park. Framed by its stunning bay, Cartagena de Indias is one of the most beautiful, well-preserved cities in the Americas; a treasure that is currently one of the most heavily frequented tourist destinations in Colombia.",
  user: User.all.sample
)

country_itinerary1 = CountryItinerary.new
country_itinerary1.itinerary = itin1
country_itinerary1.country = Country.find_by(name: "Colombia 🇨🇴")
country_itinerary1.save!

tag_itinerary1 = ItineraryTag.new
tag_itinerary1.itinerary = itin1
tag_itinerary1.tag = Tag.find_by(name: "Beach")
tag_itinerary1.save!
tag_itinerary1 = ItineraryTag.new
tag_itinerary1.itinerary = itin1
tag_itinerary1.tag = Tag.find_by(name: "Tropical")
tag_itinerary1.save!
tag_itinerary1 = ItineraryTag.new
tag_itinerary1.itinerary = itin1
tag_itinerary1.tag = Tag.find_by(name: "Surf")
tag_itinerary1.save!

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

puts "Order #{i} has been created."
i += 1

day2 = Day.new(
  order: i + 1,
  city: "Islas del Rosario",
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

puts "Order #{i} has been created."
i += 1

day3 = Day.new(
  order: i + 1,
  city: "Islas del Rosario",
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

puts "Order #{i} has been created."
i += 1

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
  description: "Peru counts with 28 individual climates. This creates a diverse ecosystem and natural variety, all in one country. You can see snow in the Andes, and not far away you can sandboard in the desert by the Huacachina Oasis. You can see Penguins at Ballestas Islands next to the dry and desert-like town of Paracas, and you can row peacefully in the Amazonian jungle rivers. You can hike up to a summit in the Andes, or you can go down to the deepest canyons in the world – Cañón del Colca and Cañón del Cotahuasi. The varieties and combinations are unlimited. Peru makes it perfect to do many short budget trips that will allow you to experience this natural variety.",
  user: User.all.sample
)

country_itinerary2 = CountryItinerary.new
country_itinerary2.itinerary = itin2
country_itinerary2.country = Country.find_by(name: "Peru 🇵🇪")
country_itinerary2.save!

tag_itinerary2 = ItineraryTag.new
tag_itinerary2.itinerary = itin2
tag_itinerary2.tag = Tag.find_by(name: "Hiking")
tag_itinerary2.save!
tag_itinerary2 = ItineraryTag.new
tag_itinerary2.itinerary = itin2
tag_itinerary2.tag = Tag.find_by(name: "Adventure")
tag_itinerary2.save!
tag_itinerary2 = ItineraryTag.new
tag_itinerary2.itinerary = itin2
tag_itinerary2.tag = Tag.find_by(name: "Animals")
tag_itinerary2.save!

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

puts "Order #{i} has been created."
i += 1

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

puts "Order #{i} has been created."
i += 1

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

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Santa Lucia de Salinas",
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
  description: "Wine has been made here for over 2600 years, making Provence the oldest wine-producing region of France. It is also the only place to focus on Rosé and is home to the only research institute dedicated to the style. Rocky mountain racing roads, wine, and lavender are the distinctive hallmarks of Provence.",
  user: User.all.sample
)

country_itinerary3 = CountryItinerary.new
country_itinerary3.itinerary = itin3
country_itinerary3.country = Country.find_by(name: "France 🇫🇷")
country_itinerary3.save!

tag_itinerary3 = ItineraryTag.new
tag_itinerary3.itinerary = itin3
tag_itinerary3.tag = Tag.find_by(name: "Sports")
tag_itinerary3.save!
tag_itinerary3 = ItineraryTag.new
tag_itinerary3.itinerary = itin3
tag_itinerary3.tag = Tag.find_by(name: "Food")
tag_itinerary3.save!
tag_itinerary3 = ItineraryTag.new
tag_itinerary3.itinerary = itin3
tag_itinerary3.tag = Tag.find_by(name: "City")
tag_itinerary3.save!

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

puts "Order #{i} has been created."
i += 1

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
  description: "For market lovers in Mexico, there’s no better state than Oaxaca. Sure, Mexico City offers strong competition and just about every town and village will have their own weekly tianguis, selling fruits and household odds and ends, but nothing competes with the famed, sprawling indoor and street markets in heavily indigenous Oaxaca. Here are the best markets in the region where you can find anything from one-of-a-kind artwork to locally produced coffee.",
  user: User.all.sample
)

country_itinerary4 = CountryItinerary.new
country_itinerary4.itinerary = itin4
country_itinerary4.country = Country.find_by(name: "Mexico 🇲🇽")
country_itinerary4.save!

tag_itinerary4 = ItineraryTag.new
tag_itinerary4.itinerary = itin4
tag_itinerary4.tag = Tag.find_by(name: "Food")
tag_itinerary4.save!
tag_itinerary4 = ItineraryTag.new
tag_itinerary4.itinerary = itin4
tag_itinerary4.tag = Tag.find_by(name: "Sports")
tag_itinerary4.save!
tag_itinerary4 = ItineraryTag.new
tag_itinerary4.itinerary = itin4
tag_itinerary4.tag = Tag.find_by(name: "Surf")
tag_itinerary4.save!

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

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Ocotlán de Morelos",
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

i += 1
day = Day.new(
  order: i + 1,
  city: "Zaachila",
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

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Santa María Atzompa",
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

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "San Bartolo Coyotepec",
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

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Cuilápam de Guerrero",
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
  description: "Let’s face it, in a city as popular as Barcelona, it can be tricky finding a new hang out not everyone has already heard about. Fortunately there are still a handful of places which aren’t on all the guide-books…yet! Read on to discover some of the coolest hidden gems in Barcelona, from speak-easy bars to secret out-door hang outs.",
  user: User.all.sample
)

country_itinerary5 = CountryItinerary.new
country_itinerary5.itinerary = itin5
country_itinerary5.country = Country.find_by(name: "Spain 🇪🇸")
country_itinerary5.save!

tag_itinerary5 = ItineraryTag.new
tag_itinerary5.itinerary = itin5
tag_itinerary5.tag = Tag.find_by(name: "Animals")
tag_itinerary5.save!
tag_itinerary5 = ItineraryTag.new
tag_itinerary5.itinerary = itin5
tag_itinerary5.tag = Tag.find_by(name: "City")
tag_itinerary5.save!
tag_itinerary5 = ItineraryTag.new
tag_itinerary5.itinerary = itin5
tag_itinerary5.tag = Tag.find_by(name: "Food")
tag_itinerary5.save!

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

puts "Order #{i} has been created."
i += 1

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

puts "Order #{i} has been created."
i += 1

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
  description: "Anyone who says Mexican time runs sloooow hasn’t walked with a Maya in the jungle. Palenque is one of the first references that comes to mind when talking about the Mayan culture and its many vestiges. The Lacandón rain forest spills across the Usumacinta River into Guatemala from Mexico’s southernmost state, Chiapas, where about a quarter of the population is indigenous. Relatively few visitors to Mexico make it to Chiapas, and far fewer make it here, though there are gorgeous waterfalls, excellent Maya ruins, the occasional jaguar spotting, and eco-camps with the Lacandón people, a Maya group that now numbers fewer than 1,000.",
  user: User.all.sample
)

country_itinerary6 = CountryItinerary.new
country_itinerary6.itinerary = itin6
country_itinerary6.country = Country.find_by(name: "Mexico 🇲🇽")
country_itinerary6.save!

tag_itinerary6 = ItineraryTag.new
tag_itinerary6.itinerary = itin6
tag_itinerary6.tag = Tag.find_by(name: "Adventure")
tag_itinerary6.save!
tag_itinerary6 = ItineraryTag.new
tag_itinerary6.itinerary = itin6
tag_itinerary6.tag = Tag.find_by(name: "Family")
tag_itinerary6.save!
tag_itinerary6 = ItineraryTag.new
tag_itinerary6.itinerary = itin6
tag_itinerary6.tag = Tag.find_by(name: "Sports")
tag_itinerary6.save!

i = 0

day = Day.new(
  order: i + 1,
  city: "Palenque",
  description: "Explore the jungle of Palenque!",
  restaurant_info: "Get breakfast in Café Haki & lunch in Casa Antoliana",
  activity_info: "Head to see the Palenque ruins with a mayan guide, who will take you to a walk in the jungle!",
  extra_info: "To schedule the tour, contact Mario +52 1 916 137 2211. Stay in jungle palace for the night!",
  latitude: "17.5110° N",
  longitude: "91.9930° W"
)
day.itinerary = itin6
day.save!
puts "Day #{day.id} has been created."

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Palenque",
  description: "Explore the culture of mayan rituals!",
  restaurant_info: "Pack your snacks to cook them on fire",
  activity_info: "Go and experience the atmosphere of Mayan Temazcal, while spending the night in the middle of a jungle!",
  extra_info: "To schedule the visit, contact Don Nico +52 1 916 120 0209",
  latitude: "41.3874° N",
  longitude: "2.1686° E"
)
day.itinerary = itin6
day.save!
puts "Day #{day.id} has been created."

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Lacanjá",
  description: "Discover one of the most remote tribes in Mexico!",
  restaurant_info: "There is a restaurant in the premises of the cabins",
  activity_info: "You will spend the day in the magical Lacandon jungle, immersed in the local tribal village. Take a swim in the numerous waterfalls!",
  extra_info: "Get accommodation in Centro Ecoturismo Maya +52 1 961 657 4929",
  latitude: "16°38'09 N",
  longitude: "19°42'07° W"
)
day.itinerary = itin6
day.save!
puts "Day #{day.id} has been created."

itin7 = Itinerary.create(
  title: "Ultimate Guide to Czech Beer",
  description: "The Czechs drink more beer than any other nation, downing approximately a pint a day for every man, woman and child in the country – in fact, more beer is drunk here than water. Czech beer (pivo) ranks among the best on the planet and the country remains the true home of most of the lager drunk around the world today.",
  user: User.all.sample
)

country_itinerary7 = CountryItinerary.new
country_itinerary7.itinerary = itin7
country_itinerary7.country = Country.find_by(name: "Czech Republic 🇨🇿")
country_itinerary7.save!

tag_itinerary7 = ItineraryTag.new
tag_itinerary7.itinerary = itin7
tag_itinerary7.tag = Tag.find_by(name: "Food")
tag_itinerary7.save!
tag_itinerary7 = ItineraryTag.new
tag_itinerary7.itinerary = itin7
tag_itinerary7.tag = Tag.find_by(name: "City")
tag_itinerary7.save!
tag_itinerary7 = ItineraryTag.new
tag_itinerary7.itinerary = itin7
tag_itinerary7.tag = Tag.find_by(name: "Snow")
tag_itinerary7.save!

i = 0
day = Day.new(
  order: i + 1,
  city: "Prague",
  description: "Start the journey in the Czech capital - in the infamous artesanal brewery U Fleku",
  restaurant_info: "U Fleku, Křemencova 11, 110 00 Nové Město, Czechia",
  activity_info: "Try the local bear together with their 'Fleck's treat' specialty",
  extra_info: "https://en.ufleku.cz/interesting-facts/",
  latitude: "50.0755° N",
  longitude: "14.4378° E"
)
day.itinerary = itin7
day.save!
puts "Day #{day.id} has been created."

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Broumy",
  description: "Continue your beer tour to a small town Broumy southwest of Prague to experience the elected number 1 Czech artesanal Beer - Matuška!",
  restaurant_info: "Pivovar Matuška, U Radnice 115, 267 42 Broumy, Czechia",
  activity_info: "Matuška is infamous between the Czechs but virtually unknown beyond the Czech border - take advantage of that and try all of their flavours!",
  extra_info: "https://shop.pivovarmatuska.cz/",
  latitude: "49.9551° N",
  longitude: "13.8523° E"
)
day.itinerary = itin7
day.save!
puts "Day #{day.id} has been created."

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Nepomuk",
  description: "Next stop is a minibrewery Zlatá Kráva - Nepomuk, a young but quickly growing brewery further in the South of Czechia!",
  restaurant_info: "Zlatá Kráva, nám. Augustina Němejce 416, 335 01 Nepomuk, Czechia",
  activity_info: "Zlatá Kráva is located in a region optimal for cycling - take advantage of that and explare the local ponds!",
  extra_info: "https://www.zlatakrava.cz/",
  latitude: "49.4862° N",
  longitude: "13.5823° E"
)
day.itinerary = itin7
day.save!
puts "Day #{day.id} has been created."

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Pilsen",
  description: "Last stop is the infamous Czech city of beer - Pilsen!",
  restaurant_info: "Beer Factory, Dominikánská 13/8, 301 00 Plzeň 3-Vnitřní Město, Czechia",
  activity_info: "Go and have a tour in the Pillsner Urquell brewery only so you can compare the commercial giant with the smaller, artensanal Beer Factory!",
  extra_info: "http://beerfactoryplzen.cz/",
  latitude: "49.7384° N",
  longitude: "13.3736° E"
)
day.itinerary = itin7
day.save!
puts "Day #{day.id} has been created."

itin8 = Itinerary.create(
  title: "Surroundings of Medellin",
  description: "Medellin, Colombia was once a place where no tourist dared to visit and widely considered to be the most dangerous city on earth. Thankfully, things have changed drastically in recent years, and Medellin now welcomes tourists with open arms.",
  user: User.all.sample
)

country_itinerary8 = CountryItinerary.new
country_itinerary8.itinerary = itin8
country_itinerary8.country = Country.find_by(name: "Colombia 🇨🇴")
country_itinerary8.save!

tag_itinerary8 = ItineraryTag.new
tag_itinerary8.itinerary = itin8
tag_itinerary8.tag = Tag.find_by(name: "City")
tag_itinerary8.save!
tag_itinerary8 = ItineraryTag.new
tag_itinerary8.itinerary = itin8
tag_itinerary8.tag = Tag.find_by(name: "Animals")
tag_itinerary8.save!

i = 0

day = Day.new(
  order: i + 1,
  city: "Medellin",
  description: "On your first day, head to the Communa 13 and take the graffiti tour with the local guide",
  restaurant_info: "Eat in La 70, two stations from Communa 13 (in Laureles)",
  activity_info: "The guide will take you to all graffiti art galeries, explain the complicated history and introduce you all the local artists!",
  extra_info: "Be ready to pay around COP 20,000",
  latitude: "6.2476° N",
  longitude: "75.5658° W"
)
day.itinerary = itin8
day.save!
puts "Day #{day.id} has been created."

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Medellin",
  description: "On your second day, head to El Poblado and enjoy the upbeat atmosphere of the neighbourhood",
  restaurant_info: "Eat in Mondongo's 70!",
  activity_info: "Stay until the night to experience the wide nightlife scene",
  extra_info: "Check Soy Local Medellin for accommodation!",
  latitude: "6.2476° N",
  longitude: "75.5658° W"
)
day.itinerary = itin8
day.save!
puts "Day #{day.id} has been created."

puts "Order #{i} has been created."
i += 1

day = Day.new(
  order: i + 1,
  city: "Medellin",
  description: "On your third day, take the cable car to La Sierra — one of the city’s newest cable car lines",
  restaurant_info: "make sure to stop by Astor Reposteria on Junnin Street for the best chocolate cake you might ever have",
  activity_info: "Walk around and enjoy the splendid natural environment",
  extra_info: "You will have to buy the local metro card for COP 2,000!",
  latitude: "6.2476° N",
  longitude: "75.5658° W"
)
day.itinerary = itin8
day.save!
puts "Day #{day.id} has been created."

# itin9 = Itinerary.create(
#   title: "Mexico City Streetfood Tour",
#   description: "Learn where to get the best tacos de pastor in CDMX!",
#   user: User.all.sample
# )
#
# country_itinerary9 = CountryItinerary.new
# country_itinerary9.itinerary = itin9
# country_itinerary9.country = Country.find_by(name: "Mexico")
# country_itinerary9.save!
#
# tag_itinerary9 = ItineraryTag.new
# tag_itinerary9.itinerary = itin9
# tag_itinerary9.tag = Tag.find_by(name: "Food")
# tag_itinerary9.tag = Tag.find_by(name: "Local Tips")
# tag_itinerary9.tag = Tag.find_by(name: "City")
# tag_itinerary9.save!
#
# day = Day.new(
#   order: i + 1,
#   city: "Mexico City",
#   description: "On your third day, take the cable car to La Sierra — one of the city’s newest cable car lines",
#   restaurant_info: "make sure to stop by Astor Reposteria on Junnin Street for the best chocolate cake you might ever have",
#   activity_info: "Walk around and enjoy the splendid natural environment",
#   extra_info: "You will have to buy the local metro card for COP 2,000!",
#   latitude: "6.2476° N",
#   longitude: "75.5658° W"
# )
# day.itinerary = itin9
# day.save!
# puts "Day #{day.id} has been created."
#
# # 3.times do |i|
#   day = Day.new(
#     order: i + 1,
#     city: Faker::Address.city,
#     description: Faker::Lorem.sentence,
#     restaurant_info: Faker::Restaurant.name,
#     activity_info: Faker::Hobby.activity,
#     extra_info: Faker::Games::WorldOfWarcraft.quote,
#     latitude: Faker::Address.latitude,
#     longitude: Faker::Address.longitude
#   )
#   day.itinerary = itin9
#   day.save!
#   puts "Day #{day.id} has been created."
# end
#
# itin10 = Itinerary.create(
#   title: "Hitchhike in Portugal!",
#   description: "The ultimate guide for backpackers in Portugal!",
#   user: User.all.sample
# )
#
# country_itinerary10 = CountryItinerary.new
# country_itinerary10.itinerary = itin10
# country_itinerary10.country = Country.find_by(name: "Portugal")
# country_itinerary10.save!
#
# tag_itinerary10 = ItineraryTag.new
# tag_itinerary10.itinerary = itin10
# tag_itinerary10.tag = Tag.find_by(name: "Beach")
# tag_itinerary10.tag = Tag.find_by(name: "Adventure")
# tag_itinerary10.tag = Tag.find_by(name: "Active Holiday")
# tag_itinerary10.tag = Tag.find_by(name: "Local Tips")
# tag_itinerary10.tag = Tag.find_by(name: "City")
# tag_itinerary10.save!
#
# 3.times do |i|
#   day = Day.new(
#     order: i + 1,
#     city: Faker::Address.city,
#     description: Faker::Lorem.sentence,
#     restaurant_info: Faker::Restaurant.name,
#     activity_info: Faker::Hobby.activity,
#     extra_info: Faker::Games::WorldOfWarcraft.quote,
#     latitude: Faker::Address.latitude,
#     longitude: Faker::Address.longitude
#   )
#   day.itinerary = itin10
#   day.save!
#   puts "Day #{day.id} has been created."
#   puts "Creating booking..."
#   booking = Booking.new
#   booking.user = User.all.sample
#   booking.itinerary = itin10
#   booking.save!
#   puts "Booking #{booking.id} has been created."
# end
#
puts "Created #{Itinerary.count} itineraries..."
puts "Created #{CountryItinerary.count} country_itineraries..."
puts "Created #{ItineraryTag.count} tag_itineraries..."

puts "Finished!"
