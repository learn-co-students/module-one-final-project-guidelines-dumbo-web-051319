require 'pry'

User.destroy_all
Roof.destroy_all
Booking.destroy_all

adam = User.create(name:"Adam", email: " adam.@gmail.com")
bob = User.create(name:"Bob", email: " bob.@gmail.com")
catherine = User.create(name:"Catherine", email: " catherine.@gmail.com")
danielle = User.create(name:"Danielle", email: " danielle.@gmail.com")
eric = User.create(name:"Eric", email: " eric.@gmail.com")
fan = User.create(name:"Fan", email: " fan.@gmail.com")
george = User.create(name:"George", email: " george.@gmail.com")
henry = User.create(name:"Henry", email: " henry.@gmail.com")

roof1=Roof.create(name:"Night of Joy", dress_code: "Casual", price_range: 1, location: "Brooklyn",  dog: true,  food: true,  ig_rating: 1,  entertainment: false,  chill: true,  happy_hour: true )
roof2=Roof.create(name:"High Line", dress_code: "Casual", price_range: 2, location: "Manhattan",  dog: false,  food: false,  ig_rating: 3,  entertainment: true,  chill: true,  happy_hour: true )
roof6=Roof.create(name:"The Wythe Hotel", dress_code: "Semi Casual", price_range: 3, location: "Brooklyn",  dog: true,  food: true,  ig_rating: 4,  entertainment: true,  chill: false,  happy_hour: true )
roof5=Roof.create(name:"McClaren", dress_code: "Semi Casual", price_range: 3, location: "Manhattan",  dog: false,  food: true,  ig_rating: 3,  entertainment: false,  chill: true,  happy_hour: false )
roof4=Roof.create(name:"Top Hat", dress_code: "Busines Casual", price_range: 5, location: "Brooklyn",  dog: false,  food: true,  ig_rating: 5,  entertainment: true,  chill: false,  happy_hour: false )
roof3=Roof.create(name:"Empire State Building", dress_code: "Busines Casual", price_range: 5, location: "Manhattan",  dog: false,  food: true,  ig_rating: 5,  entertainment: true,  chill: false,  happy_hour: false )
roof7=Roof.create(name:"The Puzzle", dress_code: "Casual Dressy", price_range: 4, location: "Brooklyn",  dog: true,  food: true,  ig_rating: 4,  entertainment: true,  chill: true,  happy_hour: false )
roof8=Roof.create(name:"The Met", dress_code: "Casual Dressy", price_range: 4, location: "Manhattan",  dog: false,  food: false,  ig_rating: 4,  entertainment: false,  chill: false,  happy_hour: true )

booking1 = Booking.create(user_id: adam.id, roof_id: roof8.id, date_time:"", party_size: 15)
booking2 = Booking.create(user_id: bob.id, roof_id: roof7.id, date_time:"", party_size: 21)
booking3 = Booking.create(user_id: catherine.id, roof_id: roof6.id, date_time:"", party_size: 37)
booking4 = Booking.create(user_id: danielle.id, roof_id: roof5.id, date_time:"", party_size: 50)
booking5 = Booking.create(user_id: eric.id, roof_id: roof4.id, date_time:"", party_size: 12)
booking6 = Booking.create(user_id: fan.id, roof_id: roof3.id, date_time:"", party_size: 31)
booking7 = Booking.create(user_id: george.id, roof_id: roof2.id, date_time:"", party_size: 14)
booking8 = Booking.create(user_id: henry.id, roof_id: roof1.id, date_time:"", party_size: 49)
