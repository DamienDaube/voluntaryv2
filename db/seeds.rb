# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Booking.destroy_all
Service.destroy_all
User.destroy_all

puts 'Creating users...'

15.times do
  User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: 'provider',
    email: Faker::Internet.email,
    password: '123456'
    ).save
end

User.new(
first_name: 'Damien',
last_name: 'Daube',
role: 'beneficiary',
email: 'sdf@gmail.com',
password: '123456'
).save

puts 'Creating services...'

20.times do
  Service.new(
    category: ['Get assistance', 'Find a room', 'See a doctor', 'Eat some food', 'Have a shower', 'Get a haircut'].sample,
    address: Faker::Address.street_address,
    price: rand(100),
    user_id: rand(15),
    ).save
  puts "DONE"
end

puts 'Creating bookings...'

20.times do
  Booking.new(
    start_date: Faker::Date.between(Date.today, 5.days.from_now),
    end_date: Faker::Date.between(5.days.from_now, 7.days.from_now),
    status: 'Pending',
    paid: false,
    user_id: rand(15),
    service_id: rand(20),
    ).save
end

puts 'Finished!'
