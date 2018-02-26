# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

add1 = "Kerobokan Kelod, Badung Regency, Bali, Indonesia"
lat1 = -8.654085
long1 = 115.1282793

add2 = "24/3 Wylde Street, Potts Point NSW, Australia"
lat2 = -33.8661864
long2 = 151.222422

add3 = "United Nations Plaza, New York, NY, USA"
lat3 = 40.7449191
long3 = -73.9795298

add4 = "Leoforos Vasilissis Sofias 91, Athens, Greece"
lat4 = 37.9820397
long4 = 23.7532603

add5 = "United Nations Avenue, Nairobi, Kenya"
lat5 = -1.2346464
long5 = 36.8119658

add6 = "Canberra ACT, Australia"
lat6 = -35.3063954
long6 = 149.1141395

add7 = "Medellin, Antioquia, Colombia"
lat7 = 6.1845115
long7 = -75.6132881

add8 = "Jalan Jakarta No.10110, RT.1/RW.3, Gelora, Central Jakarta City, Jakarta, Indonesia"
lat8 = -6.1805659
long8 = 106.8285411

add = [add1, add2, add3, add4, add5, add6, add7, add8]


5.times do
	email = Faker::Internet.email
	user = User.new(email: email, password: "passwordtest")
	if user.save
		puts "#{user.email} created and saved"
	end
end
puts "5 users created and saved!"


i = 1
8.times do
	image_path = "http://res.cloudinary.com/arnauddlc/image/upload/v1519371092/kitchens/kitchen#{i}.jpg"
	puts image_path
	price = rand(10..150)
	user = User.find(rand(1..5))
	title = Faker::StarWars.character + "'s kitchen"
	description ="Lorem ipsum dolor amet leggings taiyaki jean shorts pabst actually authentic vape green juice PBR&B. Truffaut iPhone actually, stumptown organic before they sold out biodiesel next level sustainable. Offal farm-to-table quinoa shoreditch organic la croix, YOLO air plant etsy. Aesthetic enamel pin taiyaki pok pok. Mlkshk listicle keytar vexillologist. Franzen thundercats ugh affogato pug, tilde deep v meditation pork belly taxidermy synth. Adaptogen echo park hell of squid affogato vaporware banjo af. Vice af portland venmo tumeric gluten-free cardigan pork belly tattooed."
	address = add[i-1]
	puts address
	# Faker::Address.street_address + " " + Faker::Address.city
	new_kitchen = Kitchen.new(user: user, price: price, address: address, title: title, description: description )
	new_kitchen.remote_picture_url = image_path;
	# new_kitchen.latitude = "long#{i}".to_f
	# new_kitchen.longitude = "lat#{i}".to_f
	if new_kitchen.save
		puts "#{new_kitchen.title} has been created and saved"
	end
	i += 1
end
puts "8 kitchens have been created and saved!"